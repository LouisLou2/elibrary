import 'package:flutter/material.dart';

import '../../domain/entity/author.dart';
import '../../domain/entity/book_info.dart';



class SearchProv extends ChangeNotifier {

  String searchedKeyword = '';
  List<Author>authors=[];
  List<BookInfo>books=[];
  List<String> publishers=[];

  bool get isKeywordEmpty => searchedKeyword.isEmpty;

  toggleSearchedKeyword(String keyword,{bool notify=true}) {
    searchedKeyword = keyword;
    if(notify){
      notifyListeners();
    }
  }

  void setSearchResult({
    required List<Author> authors,
    required List<BookInfo> books,
    required List<String> publishers,
  }){
    this.authors=authors;
    this.books=books;
    this.publishers=publishers;
    notifyListeners();
  }
}