import 'package:flutter/material.dart';

import '../../domain/entity/book_shelf_ele.dart';

class UserBookProv with ChangeNotifier {
  List<BookShelfEle>bookShelf=[];

  //setter
  void setBookShelf(List<BookShelfEle> shelf){
    bookShelf=shelf;
    notifyListeners();
  }
}