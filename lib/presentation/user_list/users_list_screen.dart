import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/domain/cubit/users_cubit.dart';
import 'package:users_app/domain/models/user/user.dart';
import 'package:users_app/extensions/color_scheme_ext.dart';
import 'package:users_app/injection.dart';
import 'package:users_app/presentation/router/app_router.gr.dart';
import 'package:users_app/presentation/user_list/widgets/app_text_field.dart';
import 'package:users_app/presentation/user_list/widgets/error_placeholder.dart';
import 'package:users_app/presentation/user_list/widgets/user_card.dart';
import 'package:users_app/presentation/user_list/widgets/user_not_found_placeholder.dart';

@RoutePage()
class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final _usersCubit = getIt.get<UsersCubit>();
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usersCubit.getUsers();
    _textController.addListener(_textLFieldListener);
  }

  @override
  void dispose() {
    _usersCubit.close();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _textLFieldListener() {
    _usersCubit.search(_textController.text.trim());
  }

  void _onTapUserCard(User user) {
    _focusNode.unfocus();
    context.pushRoute(
      UserDetailInfoRoute(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _usersCubit,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: AppTextField(
            focusNode: _focusNode,
            controller: _textController,
          ),
        ),
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) => state.map(
            initial: (_) => const SizedBox(),
            loading: (_) => Center(
              child: CircularProgressIndicator(
                color: context.colorScheme.surface,
              ),
            ),
            error: (error) => Center(
              child: ErrorPlaceholder(
                onTap: () => _usersCubit.getUsers(),
              ),
            ),
            success: (success) => success.users.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 21,
                    ),
                    child: ListView.builder(
                      itemCount: success.users.length,
                      itemBuilder: (context, index) {
                        final user = success.users[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: UserCard(
                            user: user,
                            onTap: () => _onTapUserCard(user),
                          ),
                        );
                      },
                    ),
                  )
                : const UserNotFoundPlaceholder(),
          ),
        ),
      ),
    );
  }
}
