import 'package:flutter/material.dart';
import 'package:users_app/extensions/color_scheme_ext.dart';
import 'package:users_app/extensions/locale_ext.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: context.colorScheme.onPrimary,
      ),
      cursorColor: context.colorScheme.onPrimary.withOpacity(0.4),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: context.locale.search,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: context.colorScheme.onPrimary.withOpacity(0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
          borderSide: BorderSide(
            color: context.colorScheme.surface,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
            borderSide: BorderSide(
              color: context.colorScheme.surface,
            )),
      ),
    );
  }
}
