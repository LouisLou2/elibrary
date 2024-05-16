import 'dart:convert';

import '../../entity/book_info.dart';

class BookListResp{
  List<BookInfo> bookList;

  BookListResp({required this.bookList});

  factory BookListResp.fromJson(Map<String,dynamic> json){
    List<dynamic> books = jsonDecode(json['books_info']);
    return BookListResp(
      bookList: List<BookInfo>.from(books.map((e) => BookInfo.fromJson(e))),
    );
  }
}