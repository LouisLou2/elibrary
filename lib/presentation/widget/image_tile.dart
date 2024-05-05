import 'package:flutter/material.dart';

import '../../style/ui_params.dart';

class ImageTile extends StatelessWidget{

  final String? title;
  final String? subTitle;
  final String? thirdTitle;
  final Widget image;
  final circleImage;
  final Color? surfaceColor;
  final Color? subtitleColor;
  final Color? backgroundColor;
  final Widget? actionWidget;
  final double? fontSize;
  final double? fontSize3;
  final FontWeight? titleWeight;
  final double? actionSize;
  final VoidCallback? onTap;

  const ImageTile({
    super.key,
    required this.title,
    this.subTitle,
    this.thirdTitle,
    required this.image,
    this.circleImage=false,
    this.surfaceColor,
    this.backgroundColor,
    this.actionWidget,
    this.fontSize,
    this.actionSize,
    this.onTap,
    this.subtitleColor,
    this.titleWeight, this.fontSize3
  });

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Card(
          margin: const EdgeInsets.all(0),
          color: backgroundColor,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: circleImage?const CircleBorder():RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIParams.tinyBorderR),
          ),
          child: image,
        ),
        const SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: titleWeight?? FontWeight.normal,
                letterSpacing: -0.6,
                color: surfaceColor,
                fontSize: fontSize,
              ),
            ),
            if(subTitle!=null)
              Text(
                subTitle!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: subtitleColor ?? Theme.of(context).colorScheme.secondary,
                  fontSize: fontSize!=null?fontSize!*0.8:null,
                  letterSpacing: -0.6,
                ),
              ),
            if(thirdTitle!=null)
              Text(
                thirdTitle!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: fontSize3??(fontSize!=null?fontSize!*0.6:null),
                ),
              ),
          ],
        ),
        if(actionWidget!=null)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: actionWidget,
            ),
          ),
      ],
    );
  }
  // @override
  // Widget build(BuildContext context){
  //   return ListTile(
  //     onTap: onTap,
  //     leading: Card(
  //       clipBehavior: Clip.antiAlias,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(UIParams.tinyBorderR),
  //       ),
  //       child: image,
  //     ),
  //     title: Text(
  //       title!,
  //       style: TextStyle(
  //         color: surfaceColor,
  //         fontSize: fontSize,
  //       ),
  //     ),
  //     subtitle: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         if(subTitle!=null)
  //           Text(
  //             subTitle!,
  //             style: TextStyle(
  //               color: surfaceColor,
  //               fontSize: fontSize!=null?fontSize!*0.8:null,
  //             ),
  //           ),
  //         if(thirdTitle!=null)
  //           Text(
  //             thirdTitle!,
  //             style: TextStyle(
  //               color: surfaceColor,
  //               fontSize: fontSize!=null?fontSize!*0.8:null,
  //             ),
  //           ),
  //       ],
  //     ),
  //     trailing: actionWidget,
  //   );
  // }
}
