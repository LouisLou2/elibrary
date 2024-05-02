import 'package:flutter/material.dart';

class HeadLine2 extends StatelessWidget {
  final String title;
  final double size;
  final String? subTitle;
  final Widget? icon;
  final String? iconText;
  final double? iconSize;
  final Color? color;
  final VoidCallback? onTap;
  final bool isItalic;


  HeadLine2({
    super.key,
    required this.title,
    required this.size,
    this.subTitle,
    this.icon,
    this.iconSize,
    this.color,
    this.onTap,
    this.isItalic = false, this.iconText,
  }) {
    assert(icon == null || iconText == null);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      title: Text(title,
        style: TextStyle(
          color:color,
          fontSize: size,
          fontWeight: FontWeight.normal,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        ),
      ),
      subtitle: subTitle != null ?
      Padding(
        padding: EdgeInsets.only(left: size * 0.15),
        child:Text(subTitle!,
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.normal,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          ),
        ),
      ) : null,
      trailing: icon == null && iconText == null ? null :
      icon != null ?
      InkWell(
        onTap: onTap,
        child: icon,
      ) :
      TextButton(
        onPressed: null,
        child: Text(
          iconText!,
          style: TextStyle(
            fontSize: iconSize,
            color: color,
          ),
        ),
      ),
    );
  }
}