import 'dart:ui' as ui;

import 'package:elibrary/extension/widget_extension.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/auth_handler.dart';
import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget image;
  final String text;
  final Color? surfaceColor;
  final double? fontSize;
  final bool useSolidColor;
  Color? solidColor;

  CustomImageCard({
    super.key,
    this.onTap,
    required this.image,
    required this.text,
    this.surfaceColor,
    this.fontSize,
    this.useSolidColor=false,
    this.solidColor,
  });

  @override
  Widget build(BuildContext context) {
    if(useSolidColor&&solidColor==null){
      solidColor=Theme.of(context).primaryColorDark;
    }
    return GestureDetector(
      onTap: onTap,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIParams.defBorderR),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // 图片
            image,
            // 模糊层
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: context.heightScale(fraction:0.05), // 卡片高度的1/5如果卡片高度是250
                    decoration: BoxDecoration(
                      color: useSolidColor?solidColor:Colors.grey.withOpacity(0.1),  // 添加一些颜色覆盖以增加文本可读性
                    ),
                    child: Center(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: surfaceColor,
                          fontWeight: FontWeight.w500,
                          fontSize: fontSize,
                          overflow: TextOverflow.ellipsis,
                          shadows: [
                            Shadow(
                              offset: const Offset(1.0, 1.0),
                              blurRadius: 2.0,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}