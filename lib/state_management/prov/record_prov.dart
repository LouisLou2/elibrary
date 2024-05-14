import 'dart:async';

import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/book.dart';
import '../../domain/entity/record.dart';
import '../../domain/resp_model/user_lending/record_list_resp.dart';

class RecordProv with ChangeNotifier {

  /*-----------------预约详情时使用--------------*/
  late BookRecord nowRecord;
  void setNowRecord(BookRecord record,{bool notify=false}){
    nowRecord = record;
    if(notify) notifyListeners();
  }
  void setNowRecord_ReservedJustNow({
    required int reserverId,
    required int libId,
    required DateTime reserveTime,
    required DateTime dueTime,
    required BookInfo bookInfo,
    notify=false,
  }){
    nowRecord = BookRecord.reservedJustNow(
      reserveId: reserverId,
      reserveTime: reserveTime,
      dueTime: dueTime,
      libId: libId,
      bookInfo: bookInfo,
    );
    if(notify) notifyListeners();
  }
  /*-----------------用于展示预约列表的部分------------------*/
  List<LendingRecord> recordList = [];
  void setRecordList(List<LendingRecord> list,{bool notify=true}){
    recordList = list;
    if(notify) notifyListeners();
  }
}