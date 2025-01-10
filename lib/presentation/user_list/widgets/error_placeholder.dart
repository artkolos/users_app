import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:users_app/extensions/color_scheme_ext.dart';
import 'package:users_app/extensions/locale_ext.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.locale.networkError,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.error,
          ),
        ),
        const Gap(16),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(context.colorScheme.primary),
          ),
          onPressed: onTap,
          child: Text(
            context.locale.tryAgain,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: context.colorScheme.onError,
            ),
          ),
        )
      ],
    );
  }
}
