import 'package:flutter/material.dart';

import '../../domain/entity/book.dart';
import '../../domain/entity/book_info.dart';

class ContentProv with ChangeNotifier {

  static int home_reco_offset=0;

  List<Book> recommendBooks = [];
  List<Book> historyBooks = [];
  List<Book> trendBooks = [];

  //setter
  void setRecoBooksWithBookInfo(List<BookInfo> books, {bool notify=false}){
    recommendBooks = books.map((e) => Book(bookInfo: e)).toList();
    home_reco_offset=recommendBooks.length;
    if(notify) notifyListeners();
  }
  //add
  void addRecommendBooks(List<BookInfo> books,{bool notify=false}) {
    recommendBooks.addAll(books.map((e) => Book(bookInfo: e)).toList());
    home_reco_offset+=recommendBooks.length;
    notifyListeners();
  }
}