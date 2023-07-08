import 'package:flutter/material.dart';
import '../theme.dart';

class MediumTextWidget extends StatelessWidget {
  const MediumTextWidget({super.key, required this.text, this.color});

  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        style: color != null
            ? AppTheme.appTextTheme.titleMedium!.copyWith(color: color)
            : AppTheme.appTextTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
