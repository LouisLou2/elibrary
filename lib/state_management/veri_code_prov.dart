import 'dart:async';

import 'package:flutter/material.dart';

class VeriCodeProv extends ChangeNotifier {
  final int gap=60;// 间隔时间
  final int len=6;// 验证码长度
  int left=60;// 剩余时间

  late String veriCode;// 6位数字字符
  late int index;// 现在正在等待用户输入的验证码的位置，0-5

  late int pauseInterval;// 暂停间隔
  int? lastPauseTime;// 上次暂停的时间

  String lastIdentifier='';// 上次发送验证码的标识符

  bool allowNextSend=false;// 是否显示重新发送验证码按钮
  Timer? timer;// 计时器

  void reset(){
    veriCode = 'a'*len; //a为无效验证码,即还未输入验证码
    index = 0;
    pauseInterval=0;
  }

  VeriCodeProv(){
    reset();
  }

  void startTimer(){
    if(timer!=null&&timer!.isActive&&lastIdentifier=='865113609@qq.com'){
      return;
    }
    pauseInterval=0;
    lastIdentifier='865113609@qq.com';
    // 计算距离上次发送验证码的时间
    left=gap;
    timer=Timer.periodic(const Duration(seconds: 1), (timer) {
      if(pauseInterval!=0){
        left-=pauseInterval;
        pauseInterval=0;
      }
      if (left > 0) {
        --left;
        notifyListeners();
      } else {
        timer.cancel();
        allowNext(true);
      }
    });
  }

  set setVeriCode(String code){
    veriCode = code;
    veriCode = veriCode.padRight(len, 'a');
    index = code.length;
    notifyListeners();
  }

  void allowNext(bool allow){
    if(allowNextSend==allow){
      return;
    }
    allowNextSend=allow;// 是否显示重新发送验证码按钮
    if(!allow){
      startTimer();
    }
    notifyListeners();
  }

  String get getVeriCode{
    return veriCode;
  }

  String getCharAt(int i){
    return veriCode[i];
  }

  void noteNowAsPause(){
    lastPauseTime=DateTime.now().millisecondsSinceEpoch;
  }
  void considerPause(){
    if(lastPauseTime!=null){
      pauseInterval += (DateTime.now().millisecondsSinceEpoch-lastPauseTime!)~/1000;
      lastPauseTime=null;
    }
  }
}