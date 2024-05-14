import 'dart:async';

import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/book.dart';

class ReserveProv with ChangeNotifier {
  /*
  * 虽说这个是Provider， 但是除了这里的时间变化会引起UI变化，
  * 其他的例如图书馆表，书籍信息，就没有设置他们驱动UI, 只是使用他们第一次的值
  * */
  static const int NoLib = -1;
  int update = 0;
  Timer? timer;
  int chosenLib = 0;
  late DateTime now;
  int leastBeginDays = 0;// 最少开始, 0表示当天，1表示明天
  int addDays = 0;
  int beginHour = 0;// 开始时间
  int addHour = 0;


  late Book book;
  void setBook(Book abook,{bool notify=true}){
    book = abook;
    if(notify) notifyListeners();
  }
  bool get isNoLib=> book.owners?.isEmpty??true;//基本不会用到， 因为如果没有图书馆，就会限制无法进入预约页面
  List<Owner> get libs => book.owners??[];
  String get chosenLibName => LibTranscationInfo.getLibName(chosenLib);
  String libNameByIndex(int index) => libs[index].libName;

  // 仅仅在进入页面初始化时调用
  void enterPage(){
    chosenLib= isNoLib?NoLib:book.owners![0].libId;
    if(timer!=null) {
      timer!.cancel();
      timer = null;
    }
    updateBookingTime(notify: false);
    timer = Timer.periodic(const Duration(hours: 1), (timer) {
      ++update;
      updateBookingTime(notify: true);
    });
  }

  void chooseLib(int index){
    chosenLib = libs[index].libId;
    notifyListeners();
  }

  void updateBookingTime({bool notify=true}){
    now = DateTime.now();
    addHour=0;
    addDays=0;
    if(now.hour>=AppTransactionParam.libClose){
      leastBeginDays = 1;
      beginHour = AppTransactionParam.libOpen;
    }
    else{
      leastBeginDays = 0;
      beginHour = now.hour+1;
    }
    if(notify) notifyListeners();
  }

  void setAddDays(int days){
    addDays = days;
  }
  void setAddHour(int hour){
    addHour = hour;
  }

  DateTime get returnTime {
    DateTime time = now.add(Duration(days: addDays+leastBeginDays,));
    time = DateTime(time.year, time.month, time.day, beginHour+addHour);
    return time;
  }
}