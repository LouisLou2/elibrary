import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ImageInfoBox extends StatelessWidget {
  final Image image;
  final String title;
  final String? subTitle;
  final Color? surfaceColor;
  final double? fontSize;

  const ImageInfoBox({Key? key, required this.image, required this.title,this.subTitle,this.surfaceColor,this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}