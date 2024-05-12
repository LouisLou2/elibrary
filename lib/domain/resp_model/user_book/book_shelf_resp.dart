import 'dart:convert';

import 'package:elibrary/domain/entity/book_shelf_ele.dart';

class BookShelfResp{
  final List<BookShelfEle> bookList;

  BookShelfResp({required this.bookList});

  factory BookShelfResp.fromJson(Map<String,dynamic>map){
    List<dynamic> items=jsonDecode(map['book_shelf']);
    List<BookShelfEle> abookList=List<BookShelfEle>.from(
        items.map((e) => BookShelfEle.fromJson(e)),
    );
    return BookShelfResp(bookList:  abookList);
  }
}