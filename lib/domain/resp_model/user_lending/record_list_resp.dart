import 'dart:convert';

import 'package:elibrary/constant/app_transaction_param.dart';

class LendingRecord{
  int book_unq_id;
  String isbn;
  String title;
  String cover_l_url;
  DateTime reserveTime;
  DateTime deadline;
  int status;
  int libId;
  String location;
  int reserveId = 0;

  LendingRecord({
    required this.book_unq_id,
    required this.isbn,
    required this.title,
    required this.cover_l_url,
    required this.reserveTime,
    required this.deadline,
    required this.status,
    required this.libId,
    required this.location,
    required this.reserveId,
  });

  factory LendingRecord.fromJson(Map<String, dynamic> json){
    return LendingRecord (
      book_unq_id: json['book_unq_id'],
      isbn: json['isbn'],
      title: json['title'],
      cover_l_url: json['cover_l_url'],
      reserveTime: DateTime.parse(json['reserve_time']),
      deadline: DateTime.parse(json['deadline']),
      status: json['status'],
      libId: json['lib_id'],
      location: json['location'],
      reserveId: json['reserve_id'],
    );
  }

  String get statusStr =>AppTransactionParam.getLendingStatusStr(status);
  bool get stillReserved => AppTransactionParam.isReserved(status);
  bool get isGoodStatus => AppTransactionParam.goodStatus(status);
}

class RecordListResp{
  final List<LendingRecord> recordList;

  RecordListResp({required this.recordList});

  factory RecordListResp.fromJson(Map<String, dynamic> json){
    List<dynamic> items = jsonDecode(json['record_list']);
    List<LendingRecord> aRecordList = List<LendingRecord>.from(
      items.map((e) => LendingRecord.fromJson(e)),
    );
    return RecordListResp(recordList: aRecordList);
  }
}