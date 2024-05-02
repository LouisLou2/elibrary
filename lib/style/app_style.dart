import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';


class ColorGroup{
  final Color backC;
  final Color foreC;
  final Color hoverC;
  const ColorGroup({
    required this.backC,
    required this.foreC,
    required this.hoverC,
  });
}

class AppStyles {
  static const textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: AppColors.lightBorderColor, width: 1.6),
  );

  static LinearGradient getLinearGradient(MaterialColor color,{bool reverse=false}){
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: !reverse?[color[400]!, color[200]!, color[100]!,]:[color[100]!, color[200]!, color[400]!,],
      stops: const [0.4, 0.6, 0.9,],
    );
  }

  static LinearGradient getDarkLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [color[400]!, color[300]!, color[200]!,],
      stops: const [0.4, 0.6, 1,],
    );
  }

  static LinearGradient getGradientWithGroup(List<Color>colorGroup){
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: colorGroup,
      stops: const [0.4, 0.7, 0.9,],
    );
  }

  static BoxDecoration getCircledBoxDecor(MaterialColor color){
    return BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: UIParams.defShadowBlurR,
            offset: const Offset(2, 2)
        ),
      ],
      gradient: getLinearGradient(color),
    );
  }

  static ButtonStyle defButtonStyle({required Color color,required double height,required double width}){
    return ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
      elevation: MaterialStateProperty.all(2),
      backgroundColor: MaterialStateProperty.all(color),
      minimumSize: MaterialStateProperty.all(Size(width, height)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIParams.smallBorderR),
        ),
      ),
    );
  }

  static const ColorGroup ErrorColorGroup= ColorGroup(
    backC: AppColors.thickRed,
    foreC: AppColors.white0,
    hoverC: AppColors.rustyRed,
  );
  static const ColorGroup InfoColorGroup= ColorGroup(
    backC: AppColors.white1,
    foreC: AppColors.dark0,
    hoverC: AppColors.white2,
  );
  static const ColorGroup SuccessColorGroup= ColorGroup(
    backC: AppColors.silentGreen,
    foreC: AppColors.white0,
    hoverC: AppColors.oilGreen,
  );
}