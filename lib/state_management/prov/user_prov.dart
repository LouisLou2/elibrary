import 'package:flutter/material.dart';

import '../../domain/entity/user.dart';
/*
* 这个类很特殊，它所兼具的不止控制UI的功能，还有控制整个应用的功能
* 此类兼具管理整个应用的用户信息，以及用户登录状态
* */
class UserProv extends ChangeNotifier{
  String tmpEmail='';
  User? user;
  bool get isLogin=>user!=null;
  String get token=>user?.token??'';

  void setTmpEmail(String e){
    tmpEmail=e;
  }

  void setUser(User? u){
    user=u;
  }
  void clearUser(){
    tmpEmail='';
    user=null;
  }
}