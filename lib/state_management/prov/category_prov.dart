import 'package:elibrary/domain/entity/book_info.dart';
import 'package:flutter/material.dart';

import '../../constant/book_const.dart';

class CategoryProv with ChangeNotifier {

  /*-----------------------最受欢迎的几类图书-----------------------*/
  List<int> mostPopular1 = BookConst.defaultMostPopularCategory1;
  // 注意这里的是mostPopular1位置index,不是代号
  String cate1Name(int index) => BookConst.getCategory1Name(mostPopular1[index]);
  String cate1Cover(int index) => BookConst.getCate1Cover(mostPopular1[index]);
  int cate1Code(int index) => mostPopular1[index];
  String get mostPopular1Key => mostPopular1.join(':');

  void setMostPopular1(List<int> list,{bool notify=true}) {
    mostPopular1 = list;
    if(notify) notifyListeners();
  }
  /*----------------------书籍类别荟萃-----------------------------*/
  int nowCategory1 = 0;// 现在正在浏览的一级类别
  late int nowCategory2;// 现在正在浏览的二级类别

  List<BookInfo> cate12Books = []; // 现在的一级二级组合类别下的书籍

  String get nowCategory1Name => BookConst.getCategory1Name(nowCategory1);

  void setNowCategory1(int id,{bool notify=true}){
    // 仅仅设置一级类别，cate12Books没有变化
    nowCategory1 = id;
    if(notify) notifyListeners();
  }
  void setNowCategory2(int id,{bool notify=true}){
    // 仅仅设置二级类别，cate12Books没有变化
    nowCategory2 = id;
    if(notify) notifyListeners();
  }
  void setCate12Books(List<BookInfo> list,{bool notify=true}){
    cate12Books = list;
    if(notify) notifyListeners();
  }
  void clearCate12Books({bool notify=true}){
    cate12Books = [];
    if(notify) notifyListeners();
  }
  /*----------------书籍类别荟萃--------------------*/
}