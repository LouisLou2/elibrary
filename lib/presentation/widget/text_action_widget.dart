import 'package:flutter/material.dart';

class TextActionWidget extends StatelessWidget {
  final Widget text;
  final VoidCallback? onTap;
  final Color? surfaceColor;
  final double? size;
  const TextActionWidget({super.key, required this.text, this.onTap, this.surfaceColor, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          text,
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: surfaceColor,
            size: size,
          ),
        ],
      ),
    );
  }

}