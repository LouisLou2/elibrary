import 'dart:convert';

import '../../entity/simple_user.dart';

class UserInfoListResp {
  List<SimpleUser> userList;
  UserInfoListResp({required this.userList});

  factory UserInfoListResp.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = jsonDecode(json['user_info_list']);
    List<SimpleUser> userList = list.map((e) => SimpleUser.fromJson(e)).toList();
    return UserInfoListResp(userList: userList);
  }
}