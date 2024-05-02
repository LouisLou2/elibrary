import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double heightScale({double fraction = 1}) => MediaQuery.sizeOf(this).height * fraction;

  double widthScale({double fraction = 1}) => MediaQuery.sizeOf(this).width * fraction;
}