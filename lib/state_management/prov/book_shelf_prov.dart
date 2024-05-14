import 'package:flutter/material.dart';

import '../../domain/entity/book_info.dart';
import '../../domain/entity/book_shelf_ele.dart';

class BookShelfProv with ChangeNotifier {

  late BookInfo confirmBookInfo;// 用于上传书架的书籍信息确认
  // 用户书架
  List<BookShelfEle>bookShelf=[];

  // book shelf
  void setBookShelf(List<BookShelfEle> shelf){
    bookShelf=shelf;
    notifyListeners();
  }
  void addBookShelf(BookShelfEle ele){
    bookShelf.add(ele);
    notifyListeners();
  }
  void removeBookFromShelf(String isbn){
    bookShelf.removeWhere((element) => element.isbn==isbn);
    notifyListeners();
  }
  void removeBooksFromShelf(List<String> isbnList){
    bookShelf.removeWhere((element) => isbnList.contains(element.isbn));
    notifyListeners();
  }
  // 用户预览
  void setConfirmBookInfo(BookInfo info){
    confirmBookInfo=info;
    notifyListeners();
  }
}