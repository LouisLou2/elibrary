import 'package:elibrary/domain/util_model/notification.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../constant/situation_enum.dart';
import '../../style/app_colors.dart';
import '../../style/ui_params.dart';

class ToastHelper {
  const ToastHelper._();

  static const Duration errorDuration=Duration(seconds: UIParams.defSnackBarDuration_error);
  static const Duration warningDuration=Duration(seconds: UIParams.defSnackBarDuration_warning);
  static const Duration successDuration=Duration(seconds: UIParams.defSnackBarDuration_success);

  static void showToaster(AppNotification notification){
    showToasterWithParam(
      title: notification.title,
      desc: notification.desc,
      situaCode: notification.situaCode,
    );
  }
  static void showToasterWithParam({required String title,String? desc,required int situaCode,}){
    // 这里如果kind=SituationEnum.SUCCESS, message就不会被使用,所以可以不用传
    // 如果需要在上一个Toast还未消失时就显示下一个Toast,可以使用toastification.dismissAll(), 这里我没有使用，他们会是堆叠的效果
    switch(situaCode){
      case SituationEnum.SUCCESS:
        showSuccess(title);
        break;
      case SituationEnum.WARNING:
        if(desc==null){
          showWarningWithouDesc(title);
        }else{
          showWarningWithDesc(title, desc);
        }
        break;
      case SituationEnum.ERROR:
        if(desc==null){
          showErrorWithouDesc(title);
        }else{
          showErrorWithDesc(title, desc);
        }
        break;
    }
  }
  static void showSuccess(String title){
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.simple,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: successDuration,
      backgroundColor: AppColors.successGreen,
      foregroundColor: Colors.white,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
    );
  }
  static void showWarningWithouDesc(String title){
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.simple,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: warningDuration,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
    );
  }
  static void showWarningWithDesc(String title,String desc){
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      description: Text(
        desc,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: warningDuration,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      showProgressBar: false,
    );
  }
  static void showErrorWithouDesc(String title){
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.simple,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: errorDuration,
      primaryColor: AppColors.normalRed,
      backgroundColor: AppColors.normalRed,
      foregroundColor: Colors.white,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
    );
  }
  static void showErrorWithDesc(String title,String desc){
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      description: Text(
        desc,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      boxShadow: lowModeShadow,
      autoCloseDuration: errorDuration,
      dragToClose: true,
      closeButtonShowType: CloseButtonShowType.none,
      showProgressBar: false,
    );
  }
}