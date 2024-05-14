class UserListParam {
  final String isbn;
  final int offset;
  final int num;

  UserListParam({
    required this.isbn,
    required this.offset,
    required this.num,
  });

  Map<String, dynamic> toJson() {
    return {
      'isbn': isbn,
      'offset': offset,
      'num': num,
    };
  }
}