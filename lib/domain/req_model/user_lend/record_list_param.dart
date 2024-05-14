class RecordListParam {
  final int offset;
  final int num;

  RecordListParam({
    required this.offset,
    required this.num,
  });

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'num': num,
    };
  }
}