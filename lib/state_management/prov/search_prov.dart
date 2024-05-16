import 'package:flutter/material.dart';

import '../../domain/entity/author.dart';
import '../../domain/entity/book_info.dart';



class SearchProv extends ChangeNotifier {

  List<String> searchKeywords = [];

  String searchedKeyword = '';
  List<Author>authors=[];
  List<BookInfo>books=[];
  List<String> publishers=[];

  bool get isKeywordEmpty => searchedKeyword.isEmpty;
  String get searchKeywordKey => searchKeywords.join(':');

  void setKeywords(List<String> keywords,{bool notify=true}){
    searchKeywords = keywords;
    if(notify){
      notifyListeners();
    }
  }

  void addSearchKeyword(String keyword,{bool notify=true}){
    if(keyword.isEmpty||(searchKeywords.isNotEmpty&&searchKeywords[0]==keyword)){
      return;
    }
    if(searchKeywords.contains(keyword)){
      searchKeywords.remove(keyword);
    }
    searchKeywords.insert(0, keyword);
    if(searchKeywords.length>10){
      searchKeywords.removeLast();
    }
    if(notify){
      notifyListeners();
    }
  }

  void toggleSearchedKeyword(String keyword,{bool notify=true}) {
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