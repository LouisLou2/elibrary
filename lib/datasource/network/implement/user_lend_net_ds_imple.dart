import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elibrary/datasource/network/manage/network_config.dart';
import 'package:elibrary/datasource/network/manage/network_manager.dart';
import 'package:elibrary/datasource/network/manage/network_path_collector.dart';
import 'package:elibrary/domain/entity/user.dart';
import 'package:elibrary/domain/req_model/user_lend/user_list_param.dart';
import 'package:elibrary/domain/resp_model/resp_body.dart';
import 'package:elibrary/domain/resp_model/user_lending/user_info_list_resp.dart';
import 'package:elibrary/domain/resp_model/user_lending/user_list_resp.dart';

import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../constant/rescode.dart';
import '../../../domain/entity/simple_user.dart';
import '../../../helper/global_exception_helpe.dart';
import '../interface/user_lend_net_ds.dart';

class UserLendNetDsImple implements UserLendNetDs {

  final Dio _userLendDio = NetworkManager.normalDio;
  late CancelToken _cancelToken;

  @override
  Future<Result<List<SimpleUser>>> getBookOwners({required String isbn, required int offset, required int num}) async {
    _cancelToken = CancelToken();
    try{
      Response response = await _userLendDio.get(
        NetworkPathCollector.userList,
        options: NetworkConfig.json_json,
        data: UserListParam(isbn: isbn, offset: offset, num: num).toJson(),
        cancelToken: _cancelToken
      );
      RespBody respBody = RespBody.fromJson(response.data);
      if(respBody.code == ResCode.SUCCESS){
        UserListResp userListResp = UserListResp.fromJson(respBody.data);
        return Result.success(userListResp.userList);
      }
      return Result.abnormal(respBody.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Result<List<SimpleUser>>> getUserInfo({required List<int> userIds}) async {
    _cancelToken = CancelToken();
    try{
      Response response = await _userLendDio.get(
        NetworkPathCollector.userInfo,
        options: NetworkConfig.json_json,
        data: {
          'user_id_list': jsonEncode(userIds),
        },
        cancelToken: _cancelToken,
      );
      RespBody respBody = RespBody.fromJson(response.data);
      if(respBody.code == ResCode.SUCCESS){
        UserInfoListResp userInfoListResp = UserInfoListResp.fromJson(respBody.data);
        return Result.success(userInfoListResp.userList);
      }
      return Result.abnormal(respBody.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}