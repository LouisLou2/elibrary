import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getCustomFilledButton({required context,required String text,required VoidCallback onPressed, Color? backgroundColor, Color? textColor}){
  return FilledButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        backgroundColor??Theme.of(context).colorScheme.primary,
      ),
    ),
    onPressed: onPressed,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: textColor?? Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ),
  );
}