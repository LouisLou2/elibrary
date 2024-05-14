import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class GradientImageCard extends StatelessWidget {
  final Widget image;
  final String? text;
  final VoidCallback? onTap;
  const GradientImageCard({super.key, required this.image, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child:Stack(
          fit: StackFit.expand,
          children: [
            // 背景图片
            image,
            // 渐变蒙版
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [0.1, 0.55],
                  colors: [
                    AppColors.deepBlue.withOpacity(0.9), // 渐变颜色的起始颜色，这里是半透明黑色
                    Colors.transparent, // 渐变颜色的结束颜色，这里是完全透明
                  ],
                ),
              ),
            ),
            // 文字内容
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                text ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
