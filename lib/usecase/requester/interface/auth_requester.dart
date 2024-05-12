import '../../../domain/entity/user.dart';
import '../../../domain/util_model/res_info.dart';

abstract class AuthReq {
  Future<Result<User>> loginWithEmailPwd(String email, String password);
  Future<Result<bool>> requestEmailCode(String email);
  Future<Result<bool>> firstSetPwd(String email, String password);
  Future<Result<User>> loginWithEmailCode(String email, String code);
}