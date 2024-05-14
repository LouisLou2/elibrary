import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/util/format_util.dart';

import 'book_info.dart';

enum RecordStatus {
  reserved,//预约未取书
  borrowed,//已取书未归还
  returned,//已归还
  overdue,//逾期未归还
  canceled,//取消预约
}

class BookRecord{
  int status;
  int? reserveId;
  DateTime reserveTime;
  DateTime dueTime;
  int libId;
  BookInfo bookInfo;

  BookRecord({
    required this.status,
    required this.reserveTime,
    required this.dueTime,
    required this.libId,
    required this.bookInfo,
    this.reserveId,
  });

  BookRecord.reservedJustNow({
    required this.reserveId,
    required this.reserveTime,
    required this.dueTime,
    required this.libId,
    required this.bookInfo,
  }):status=AppTransactionParam.reservingStatus;

  String get libName => LibTranscationInfo.getLibName(libId);
  String get reserveCode => '$reserveId';

  String get statusStr =>AppTransactionParam.getLendingStatusStr(status);
  bool get stillReserved => AppTransactionParam.isReserved(status);
  bool get isGoodStatus => AppTransactionParam.goodStatus(status);
  // String get reserveTimeDateStr => FormatTool.dateScaleStr2(reserveTime);
  // String get dueTimeDateStr => FormatTool.dateScaleStr2(dueTime);
  // String dueTimeStr() => FormatTool.hourStr(dueTime.hour);
}