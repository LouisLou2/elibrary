import '../../entity/book_info.dart';

class BookListResp{
  List<BookInfo> bookList;

  BookListResp({required this.bookList});

  factory BookListResp.fromJson(Map<String,dynamic> json){
    return BookListResp(
      bookList: json['book_list'].map((e) => BookInfo.fromJson(e)).toList()
    );
  }
}