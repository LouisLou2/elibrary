import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecTextWidget {
  static Widget mediumTitle(String text,BuildContext context)=>Text(
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: -0.7,
    ),
    text,
  );
  static Widget smallTitle(String text,BuildContext context)=>Text(
    style: Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      letterSpacing: -0.7,
    ),
    text,
  );
}