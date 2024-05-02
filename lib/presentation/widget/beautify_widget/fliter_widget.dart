import 'dart:ui';

import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget{
  final Widget? child;
  final double? sigmaX;
  final double? sigmaY;
  final bool hasColor;
  const FilterWidget({super.key, this.child,this.sigmaX,this.sigmaY,this.hasColor=false});
  @override
  Widget build(BuildContext context){
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX??8,sigmaY: sigmaY??8),
        child: Container(
          color: hasColor?Colors.black.withOpacity(0.1):Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}