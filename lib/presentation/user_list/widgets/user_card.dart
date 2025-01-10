import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:users_app/domain/models/user/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.onTap,
  });

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.primary, //Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onPrimary,
                    ),
                    overflow: TextOverflow.clip,
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 34,
              )
            ],
          ),
        ),
      ),
    );
  }
}
