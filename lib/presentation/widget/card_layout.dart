import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  final Image image;
  final String title;
  final String? subTitle;
  final Color? surfaceColor;
  final Widget? action;
  final Color? backColor;
  final double? fontSize;

  const CardLayout(
      {super.key,
        required this.image,
        required this.title,
        this.subTitle,
        this.surfaceColor,
        this.action,
        this.backColor,
        this.fontSize
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIParams.defBorderR),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 5, 15),
            width: image.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: surfaceColor?.withOpacity(0.4),
                        ),
                      ),
                  ],
                ),
                if(action!=null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: action,
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}