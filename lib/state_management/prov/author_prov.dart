import 'package:elibrary/domain/entity/author.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';

import '../../constant/data_enum.dart';
import '../../domain/entity/book_info.dart';

class AuthorProv extends ChangeNotifier{

  DataEnum wholePageState = DataEnum.LOADING;
  DataEnum authorBookState = DataEnum.LOADING;

  int authorId = -1;// 现在正在浏览的作者id
  late Author nowAuthor;// 现在正在浏览的作者
  List<BookInfo> authorBooks = [];// 现在的作者下的书籍

  Tuple3<int,DataEnum,DataEnum> get nowStatusAndLen => Tuple3(
    authorBooks.length,
    wholePageState,
    authorBookState,
  );

  void setAuthorId(int id){
    //为了即使第一次网络请求失败，再次尝试时也知道是哪一个请求,
    authorId = id;
  }

  void setAllGood({bool notify=true}){
    wholePageState = DataEnum.SUCCESS;
    authorBookState = DataEnum.SUCCESS;
    if(notify) notifyListeners();
  }
  void setFullData({
    required Author author,
    required List<BookInfo> list,
    bool notify=true,
  }){
    nowAuthor = author;
    authorBooks = list;
    setAllGood(notify: false);
    if(notify) notifyListeners();
  }
  void setAuthorBooks({required List<BookInfo> list, bool notify=true}){
    authorBooks = list;
    if(notify) notifyListeners();
  }
  void addAuthorBooks({required List<BookInfo> list, bool notify=true}){
    authorBooks.addAll(list);
    if(notify) notifyListeners();
  }
  void setWholePageState(DataEnum state,{bool notify=true}){
    wholePageState = state;
    if(notify) notifyListeners();
  }
  void setAuthorBookState(DataEnum state,{bool notify=true}){
    authorBookState = state;
    if(notify) notifyListeners();
  }

  void disposeForAuthor(){
    authorBooks = [];
  }
}