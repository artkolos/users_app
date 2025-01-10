import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfoHolder extends StatelessWidget {
  const InfoHolder({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      child: Row(
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: colorScheme.onPrimary,
            ),
          ),
          const Gap(21),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 18,
                color: colorScheme.onPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
