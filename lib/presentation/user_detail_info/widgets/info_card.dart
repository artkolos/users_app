import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:users_app/extensions/color_scheme_ext.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.content,
    required this.title,
  });

  final List<Widget> content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.onPrimary,
          ),
        ),
        const Gap(8),
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: content,
          ),
        ),
      ],
    );
  }
}
