import 'package:flutter/material.dart';

class NamedDivider extends StatelessWidget {
  final String name;
  final double height;
  final double dividerHeight;
  final double width;
  final double margin;
  final Color dividerColor;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  const NamedDivider({super.key,
    required this.name,
    this.height = 1,
    this.width = 0,
    this.dividerColor = Colors.grey,
    this.textAlign = TextAlign.center,
    this.margin=10.0,
    required this.dividerHeight,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: margin),
              child: Divider(
                color: dividerColor,
                height: dividerHeight,
              ),
            ),
          ),
          Text(
            name,
            textAlign: textAlign,
            style: textStyle,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: margin),
              child: Divider(
                color: dividerColor,
                height: dividerHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}