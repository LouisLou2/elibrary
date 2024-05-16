import 'dart:convert';

import '../entity/book_info.dart';

class AuthorResp{
  final int authorId;
  final String name;
  final String? desc;
  List<BookInfo> books;

  AuthorResp({
    required this.authorId,
    required this.name,
    this.desc,
    required this.books,
  });

  factory AuthorResp.fromJson(Map<String, dynamic> json){
    dynamic nn=json['books'];
    List<dynamic> booksDy = jsonDecode(json['books']);
    List<BookInfo> books = List<BookInfo>.from(booksDy.map((e) => BookInfo.fromJson(e)));
    return AuthorResp(
      authorId: json['author_id'],
      name: json['name'],
      desc: json['desc'],
      books: books,
    );
  }
}