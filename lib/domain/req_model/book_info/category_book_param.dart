class CategoryBookParam {
  int category1;
  int category2;
  int offset;
  int num;

  CategoryBookParam({
    required this.category1,
    required this.category2,
    required this.offset,
    required this.num,
  });

  Map<String, dynamic> toJson() {
    return {
      'category1': category1,
      'category2': category2,
      'offset': offset,
      'num': num,
    };
  }
}