import 'package:elibrary/domain/entity/book_info.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/book_shelf_ele.dart';
import '../../domain/entity/record.dart';
import '../../domain/entity/simple_user.dart';

class UserLendingProv with ChangeNotifier {

  /*-----------现在正在考虑BookInfo为nowBookInfo的UserList--------*/
  late BookInfo nowBookInfo;
  final List<SimpleUser> userList = [];
  int get userListOffset => userList.length;

  void addUserList(List<SimpleUser> userList,{notify=true}) {
    userList.addAll(userList);
    if(notify){
      notifyListeners();
    }
  }
  void setNowBookInfo(BookInfo bookInfo, {notify=true}){
    nowBookInfo = bookInfo;
    if(notify){
      notifyListeners();
    }
  }
  void setUserList(List<SimpleUser> userList,{notify=true}){
    this.userList.clear();
    this.userList.addAll(userList);
    if(notify){
      notifyListeners();
    }
  }

  /*----------用户现在查看的用户信息--------------------------------*/
  late SimpleUser nowUser;
  List<BookShelfEle> nowUserShelf = [];
  void setNowUser(SimpleUser user,{notify=true}){
    nowUser = user;
    if(notify){
      notifyListeners();
    }
  }
  void setNowUserShelf(List<BookShelfEle> shelf,{notify=true}){
    nowUserShelf.clear();
    nowUserShelf.addAll(shelf);
    if(notify){
      notifyListeners();
    }
  }
  /*------------------------------------------------------------*/
}