import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/domain/entity/user.dart';

class SimpleUser {
  final int userId;
  final String name;
  final bool role;
  final int location;

  SimpleUser({
    required this.userId,
    required this.name,
    required this.role,
    required this.location,
  });

  factory SimpleUser.fromJson(Map<String, dynamic> json) {
    return SimpleUser(
      userId: json['user_id'],
      name: json['name'],
      role: json['role'],
      location: json['location'],
    );
  }

  factory SimpleUser.fromUser(User user){
    return SimpleUser(
      userId: user.userId,
      name: user.name,
      role: user.role,
      location: user.location??-1,
    );
  }

  String get roleStr => role ? '老师' : '同学';
  String get avatarStr => name.isNotEmpty ? name[0] : 'U';
  String get locationStr => AppTransactionParam.getCampusName(location);
}