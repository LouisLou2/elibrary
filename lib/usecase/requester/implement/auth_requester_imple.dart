import 'package:dio/dio.dart';
import 'package:elibrary/datasource/network/manage/network_config.dart';
import 'package:elibrary/domain/req_model/auth/first_set_pwd_param.dart';
import 'package:elibrary/domain/req_model/auth/req_veri_code.dart';
import 'package:elibrary/domain/resp_model/auth/sign_in_resp.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../constant/rescode.dart';
import '../../../datasource/network/manage/network_manager.dart';
import '../../../datasource/network/manage/network_path_collector.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/req_model/auth/email_code_param.dart';
import '../../../domain/req_model/auth/email_pwd_param.dart';
import '../../../domain/resp_model/resp_body.dart';
import '../../../helper/global_exception_helpe.dart';
import '../interface/auth_requester.dart';

class AuthRequesterImple implements AuthReq {

  Dio authDio=NetworkManager.normalDio;
  late CancelToken _cancelToken;

  @override
  Future<Result<User>> loginWithEmailPwd(String email, String password) async {
    _cancelToken=CancelToken();
    try {
      Response response = await authDio.get(
        NetworkPathCollector.account,
        data: EmailPasswordParam(
          email: email,
          password: password,
        ).toJson(),
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      if(respBody.code==ResCode.SUCCESS){
        User user= SignInResp.getFullUser(respBody.data);
        return Result.success(user);
      }else{
        return Result.abnormal(respBody.code);
      }
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo<User>(e);
    }
  }

  @override
  Future<Result<bool>> requestEmailCode(String email) async{
    _cancelToken = CancelToken();
    try{
      Response response = await authDio.post(
        NetworkPathCollector.requestEmailCode,
        data: ReqVeriCodeParam.email(email).toJson(),
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      return Result(respBody.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo<bool>(e);
    }
  }

  @override
  Future<Result<User>> loginWithEmailCode(String email, String code) async {
    _cancelToken=CancelToken();
    try {
      Response response = await authDio.get(
        NetworkPathCollector.account,
        data: EmailCodeParam(
          email: email,
          code: code,
        ).toJson(),
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      if(respBody.code==ResCode.SUCCESS||respBody.code==ResCode.USER_PWD_UNSET){
        User user= SignInResp.getFullUser(respBody.data);
        return Result.success(user);
      }else{
        return Result.abnormal(respBody.code);
      }
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo<User>(e);
    }
  }

  @override
  Future<Result<bool>> firstSetPwd(String email, String password) async {
    _cancelToken = CancelToken();
    try{
      Response response = await authDio.put(
        NetworkPathCollector.account,
        data: FirstSetPwdParam(
          email: email,
          password: password,
        ).toJson(),
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      return Result(respBody.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo<bool>(e);
    }
  }
}