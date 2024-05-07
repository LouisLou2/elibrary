import 'package:flutter/material.dart';

class SpecTextWidget {
  static Widget mediumTitle({required String text,required BuildContext context, Color? color})=>Text(
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: -0.7,
      color: color,
    ),
    text,
  );
  static Widget smallTitle({required String text,required BuildContext context, Color? color})=>Text(
    style: Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: color,
      letterSpacing: -0.7,
    ),
    text,
  );
}