import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/ui_params.dart';

class CustomImageTile extends StatelessWidget{

  final String? title;
  final String? subTitle;
  final String? thirdTitle;
  final Widget image;
  final Widget? customTitleWidget;
  final circleImage;
  final Color? surfaceColor;
  final Color? surfaceColor2;
  final Color? backgroundColor;
  final Widget? actionWidget;
  double? fontSize;
  final double? fontSize2;
  final double? fontSize3;
  final double? actionSize;
  final VoidCallback? onTap;

  CustomImageTile({
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
    this.fontSize2,
    this.fontSize3,
    this.actionSize,
    this.onTap,
    this.customTitleWidget,
    this.surfaceColor2
  });

  @override
  Widget build(BuildContext context) {
    fontSize ??= Theme.of(context).textTheme.titleMedium?.fontSize??16.sp;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UIParams.defBorderR.r),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.6,
                      color: surfaceColor,
                      fontSize: fontSize,
                    ),
                  ),
                  if(subTitle!=null)
                    Text(
                      subTitle!,
                      style: TextStyle(
                        color: surfaceColor2 ?? Theme.of(context).colorScheme.secondary,
                        fontSize: fontSize2 ?? fontSize!*0.85,
                        letterSpacing: -0.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  SizedBox(height: fontSize!*0.5,),
                  if(thirdTitle!=null)
                    Text(
                      thirdTitle!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: fontSize3 ?? fontSize!*0.75,
                      ),
                    ),
                  if(customTitleWidget!=null)
                    customTitleWidget!,
                ],
              ),
            ),
            Card(
              color: backgroundColor,
              clipBehavior: Clip.antiAlias,
              shape: circleImage?const CircleBorder():RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIParams.tinyBorderR.r),
              ),
              child: image,
            ),
          ],
        ),
      )
    );
  }
}
