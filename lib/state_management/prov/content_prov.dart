import 'package:flutter/material.dart';

import '../../domain/entity/book.dart';
import '../../domain/entity/book_info.dart';

class ContentProv with ChangeNotifier {

  /*------For Book Detal Page--------*/
  List<Book> browsedBookStack = [];// 用于记录应用运行过程中，浏览过的书籍，用于返回
  late Book currentDetailBook;// 正处于在book_detail页面的书籍

  void setNowBook(Book book){
    currentDetailBook = book;
    browsedBookStack.add(book);
    notifyListeners();
  }

  void popBookStack(){   // 此方法是给路由监听器NavigationObserver调用的, 其他类不应该调用
    if(browsedBookStack.isEmpty) return;
    browsedBookStack.removeLast();
    if(browsedBookStack.isNotEmpty) currentDetailBook = browsedBookStack.last;
    //notifyListeners();
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
  String get recoBookKey => List.generate(recommendBooks.length, (index) => recommendBooks[index].bookInfo.isbn).join(':');

  /*---------ForRecentBrowsed------------------*/
  List<BookInfo> recentBrowsedBooks = [];
  void setRecentBrowsedBooks(List<BookInfo> books,{bool notify=true}){
    recentBrowsedBooks = books;
    if(notify) notifyListeners();
  }

  void addRecentBrowsedBooks(List<BookInfo> books,{bool notify=true}){
    recentBrowsedBooks.addAll(books);
    if(notify) notifyListeners();
  }
  String get recentBrowsedBookKey => List.generate(recentBrowsedBooks.length, (index) => recentBrowsedBooks[index].isbn).join(':');
  /*------------for trending-----------*/
  List<BookInfo> trendingBooks = [];
  void setTrendingBooks(List<BookInfo> books,{bool notify=true,}){
    trendingBooks = books;
    if(notify) notifyListeners();
  }
  void addTrendingBooks(List<BookInfo> books,{bool notify=true}){
    trendingBooks.addAll(books);
    if(notify) notifyListeners();
  }
  String get trendingBookKey => List.generate(trendingBooks.length, (index) => trendingBooks[index].isbn).join(':');
  /*------------for new books-----------*/
}