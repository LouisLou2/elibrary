import 'dart:convert';

import '../../entity/author.dart';
import '../../entity/book_info.dart';

class SearchResp{
  List<Author> authors;
  List<String> publishers;
  List<BookInfo> books;

  SearchResp({
    required this.authors,
    required this.publishers,
    required this.books,
  });

  factory SearchResp.fromJson(Map<String, dynamic> json){
    List<Author> authors = [];
    List<String> publishers = [];
    List<BookInfo> books = [];
    if(json['authors'] != null){
      List<dynamic> list = json['authors'];
      authors = List<Author>.from(list.map((e) => Author.fromJson(e)));
    }
    if(json['publishers'] != null){
      List<dynamic> list = json['publishers'];
      publishers = List<String>.from(list);
    }
    if(json['books_info'] != null){
      List<dynamic> list = jsonDecode(json['books_info']);
      books = List<BookInfo>.from(list.map((e) => BookInfo.fromJson(e)));
    }
    return SearchResp(
      authors: authors,
      publishers: publishers,
      books: books,
    );
  }
}