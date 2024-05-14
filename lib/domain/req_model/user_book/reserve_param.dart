import 'package:elibrary/util/format_util.dart';

class ReserveParam {
  final String isbn;//书籍isbn
  int libId;//图书馆id
  DateTime dueTime;//归还时间

  ReserveParam({
    required this.isbn,
    required this.libId,
    required this.dueTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'isbn': isbn,
      'lib_id': libId,
      'due_time': FormatTool.transferTimeStr(dueTime),
    };
  }
}