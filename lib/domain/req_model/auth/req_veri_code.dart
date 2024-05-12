import 'package:elibrary/constant/identity_kind.dart';

class ReqVeriCodeParam {
  final String email;
  final int way;
  ReqVeriCodeParam({
    required this.email,
    required this.way,
  });
  ReqVeriCodeParam.email(this.email):way=IdentityKind.EMAIL;
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'way': way,
    };
  }
}