class RecoParam{
  final int offset;
  final int num;
  RecoParam({required this.offset, required this.num});

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'num': num,
    };
  }
}