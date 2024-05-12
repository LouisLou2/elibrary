import '../../entity/user.dart';

class SignInResp{
  final String token;
  final User user;

  SignInResp({
    required this.token,
    required this.user,
  });

  factory SignInResp.fromJson(Map<String, dynamic> map){
    return SignInResp(
      token: map['token'],
      user: User.fromJsonBasicInfo(map['user']),
    );
  }

  void equipToken(){
    user.token=token;
  }

  // 尽量用这个方法获取完整的User对象
  static User getFullUser(Map<String, dynamic> map){
    SignInResp signInResp=SignInResp.fromJson(map);
    signInResp.equipToken();
    return signInResp.user;
  }
}