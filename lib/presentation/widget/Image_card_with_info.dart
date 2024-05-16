import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';

class ImageInfoBox extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget image;
  final String title;
  final String? subTitle;
  final Color? surfaceColor;
  final double? fontSize;

  const ImageInfoBox({super.key, required this.image, required this.title,this.subTitle,this.surfaceColor,this.fontSize, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UIParams.defBorderR),
            ),
            child: image,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1,
                    ),
                  ),
                  if(subTitle!=null)
                    Text(
                      subTitle!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize!=null?fontSize!*0.8:null,
                      ),
                    ),
                ],
              )
          ),
        ],
      ),
    );
  }
}