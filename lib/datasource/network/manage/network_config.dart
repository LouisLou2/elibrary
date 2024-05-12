import 'package:dio/dio.dart';
import 'package:elibrary/state_management/prov_manager.dart';

import '../../../../config/config.dart';
import '../../../state_management/prov/user_prov.dart';

class NetworkConfig{
  static late UserProv userProv;

  static bool autoUseToken = true;// 自动将token加入到请求头
  static Duration defaultTimeout = const Duration(milliseconds: Configs.CONNECT_TIMEOUT);
  static Duration longerTimeout = const Duration(milliseconds: Configs.CONNECT_TIMEOUT*2);

  static void init(){
    userProv = ProvManager.userProv;
  }

  static String _authorizationToken()=> 'Bearer ${userProv.token}';

  // 请求与返回类型的枚举
  static Options get formdata_json => Options(
    headers:{
      'Authorization': _authorizationToken(),
    },
    contentType: Headers.multipartFormDataContentType,
    responseType: ResponseType.json,
  );
  static Options get  json_json => Options(
    headers:{
      'Authorization': _authorizationToken(),
    },
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );
}