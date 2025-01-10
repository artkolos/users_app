import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:users_app/domain/models/user/user.dart';
import 'package:users_app/extensions/color_scheme_ext.dart';
import 'package:users_app/extensions/locale_ext.dart';
import 'package:users_app/presentation/user_detail_info/widgets/info_card.dart';
import 'package:users_app/presentation/user_detail_info/widgets/info_holder.dart';

@RoutePage()
class UserDetailInfoScreen extends StatefulWidget {
  const UserDetailInfoScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<UserDetailInfoScreen> createState() => _UserDetailInfoScreenState();
}

class _UserDetailInfoScreenState extends State<UserDetailInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final colorScheme = context.colorScheme;
    final locale = context.locale;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 21,
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(21),
                    decoration: BoxDecoration(
                      color: colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      user.name[0],
                      style: TextStyle(
                        fontSize: 24,
                        color: colorScheme.onSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 21,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            InfoCard(
              content: [
                InfoHolder(
                  title: locale.username,
                  content: user.username,
                ),
                const Divider(
                  color: Colors.white,
                ),
                InfoHolder(
                  title: locale.phone,
                  content: user.phone,
                ),
                const Divider(
                  color: Colors.white,
                ),
                InfoHolder(
                  title: locale.website,
                  content: user.website,
                ),
              ],
              title: locale.aboutUser,
            ),
            const Gap(16),
            InfoCard(
              content: [
                InfoHolder(
                  title: locale.city,
                  content: user.address.city,
                ),
                const Divider(
                  color: Colors.white,
                ),
                InfoHolder(
                  title: locale.street,
                  content: user.address.street,
                ),
                const Divider(
                  color: Colors.white,
                ),
                InfoHolder(
                  title: locale.suite,
                  content: user.address.suite,
                ),
                const Divider(
                  color: Colors.white,
                ),
                InfoHolder(
                  title: locale.zipcode,
                  content: user.address.zipcode,
                ),
              ],
              title: locale.address,
            ),
            const Gap(16),
            InfoCard(
              content: [
                InfoHolder(
                  title: locale.name,
                  content: user.company.name,
                ),
                const Divider(
                  color: Colors.white,
                ),
                InfoHolder(
                  title: locale.catchPhrase,
                  content: user.company.catchPhrase,
                ),
                const Divider(
                  color: Colors.white,
                ),
                InfoHolder(
                  title: locale.bs,
                  content: user.company.bs,
                ),
              ],
              title: locale.company,
            ),
          ],
        ),
      ),
    );
  }
}
