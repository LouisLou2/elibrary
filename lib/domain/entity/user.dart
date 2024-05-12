import 'package:isar/isar.dart';
part 'user.g.dart';

@collection
class User{
  Id id=Isar.autoIncrement;
  @Index(unique: true)
  int userId;
  @Index(unique: true)
  String email;
  String name;
  bool role;
  int? location;
  bool? gender;
  String token;
  DateTime? lastLogin;

  User({
    required this.userId,
    required this.email,
    required this.name,
    required this.role,
    required this.token,
    this.location,
    this.gender,
    this.lastLogin,
  });

  // 仅仅解析基本信息，不包括token和lastLogin
  User.fromJsonBasicInfo(Map<String, dynamic> map)
      : userId = map['user_id'],
        email = map['email'],
        name = map['name'],
        role = map['role'],
        location = map['location'],
        gender = map['gender'],
        token = '';
}