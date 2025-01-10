import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:users_app/domain/models/user/user.dart';
import 'package:users_app/domain/repository/users_repository.dart';

part 'users_state.dart';

part 'users_cubit.freezed.dart';

@injectable
class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.usersRepository) : super(const UsersState.initial());

  final UsersRepository usersRepository;

  final List<User> users = List.empty(growable: true);

  void getUsers() async {
    try {
      emit(const UsersState.loading());
      final loadedUsers = await usersRepository.getUsers();
      users.addAll(loadedUsers);
      emit(UsersState.success(users: loadedUsers));
    } on Exception catch (err) {
      emit(UsersState.error(exception: err));
    }
  }

  void search(String text) {
    if (text.isEmpty) {
      emit(UsersState.success(users: users));
      return;
    }
    final searchedUsers = users
        .where(
          (e) => e.name.toLowerCase().contains(text.toLowerCase()),
        )
        .toList();
    emit(UsersState.success(users: searchedUsers));
  }
}
