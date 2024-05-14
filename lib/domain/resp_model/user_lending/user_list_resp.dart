import 'dart:convert';

import '../../entity/simple_user.dart';

class UserListResp {
  final List<SimpleUser> userList;

  UserListResp({required this.userList});

  factory UserListResp.fromJson(Map<String, dynamic> json) {
    List<dynamic> items = jsonDecode(json['user_list']);
    List<SimpleUser> aUserList = List<SimpleUser>.from(
      items.map((e) => SimpleUser.fromJson(e)),
    );
    return UserListResp(userList: aUserList);
  }
}