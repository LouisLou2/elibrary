import 'package:flutter/material.dart';

class TextActionWidget extends StatelessWidget {
  final Text text;
  final VoidCallback? onTap;
  final Color? surfaceColor;
  final double? size;
  const TextActionWidget({Key? key, required this.text, this.onTap, this.surfaceColor, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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