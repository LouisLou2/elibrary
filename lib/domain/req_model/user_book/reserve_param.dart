class ReserveParam {
  final String isbn;//书籍isbn
  int lib_id;//图书馆id
  DateTime reserve_time;//预约取书时间
  int keep_days;//保留时间

  ReserveParam({
    required this.isbn,
    required this.lib_id,
    required this.reserve_time,
    required this.keep_days,
  });

  Map<String, dynamic> toMap() {
    return {
      'isbn': isbn,
      'lib_id': lib_id,
      'reserve_time': reserve_time,
      'keep_days': keep_days,
    };
  }
}