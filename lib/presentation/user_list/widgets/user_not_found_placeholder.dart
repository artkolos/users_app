import 'package:flutter/material.dart';
import 'package:users_app/extensions/color_scheme_ext.dart';
import 'package:users_app/extensions/locale_ext.dart';

class UserNotFoundPlaceholder extends StatelessWidget {
  const UserNotFoundPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.locale.userNotFound,
        style: TextStyle(
          fontSize: 21,
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
