import 'package:dio/dio.dart';
import 'package:elibrary/domain/req_model/user_book/rm_book_param.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../datasource/network/manage/network_config.dart';
import '../../../datasource/network/manage/network_manager.dart';
import '../../../datasource/network/manage/network_path_collector.dart';
import '../../../domain/resp_model/resp_body.dart';
import '../../../helper/global_exception_helpe.dart';
import '../interface/userbook_requester.dart';

class UserBookReqImplent implements UserBookReq {

  Dio userBookReqDio=NetworkManager.normalDio;
  late CancelToken _cancelToken;
  @override
  Future<Result<bool>> addBookToShelf(String isbn) async {
    _cancelToken=CancelToken();
    try{
      Response response = await userBookReqDio.put(
        NetworkPathCollector.bookShelf,
        data: {"isbn":isbn},
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
  Future<Result<bool>> removeBookFromShelf(List<String> isbnList) async {
    _cancelToken=CancelToken();
    try{
      Response response = await userBookReqDio.delete(
        NetworkPathCollector.bookShelf,
        data: RemoveBookParam(
          isbnList: isbnList,
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