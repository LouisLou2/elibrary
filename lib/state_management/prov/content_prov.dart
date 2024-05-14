import 'package:flutter/material.dart';

import '../../domain/entity/book.dart';
import '../../domain/entity/book_info.dart';

class ContentProv with ChangeNotifier {

  /*------For Book Detal Page--------*/
  late Book currentDetailBook;// 正处于在book_detail页面的书籍
  void setNowBook(Book book){
    currentDetailBook = book;
    notifyListeners();
  }

  /*------For Recomendation---------*/
  List<Book> recommendBooks = [];
  void setRecoBooksWithBookInfo(List<BookInfo> books, {bool notify=false}){
    recommendBooks = books.map((e) => Book(bookInfo: e)).toList();
    if(notify) notifyListeners();
  }
  void addRecommendBooks(List<BookInfo> books,{bool notify=false}) {
    recommendBooks.addAll(books.map((e) => Book(bookInfo: e)).toList());
    notifyListeners();
  }
  /*---------Other------------------*/
  List<Book> historyBooks = [];
  List<Book> trendBooks = [];
}