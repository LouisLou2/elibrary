import 'package:dio/dio.dart';
import 'package:elibrary/datasource/network/manage/network_config.dart';
import 'package:elibrary/datasource/network/manage/network_path_collector.dart';
import 'package:elibrary/domain/entity/book_shelf_ele.dart';

import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/helper/global_exception_helpe.dart';

import '../../../constant/rescode.dart';
import '../../../domain/entity/book_shelf.dart';
import '../../../domain/req_model/user_lend/record_list_param.dart';
import '../../../domain/resp_model/resp_body.dart';
import '../../../domain/resp_model/user_book/book_shelf_resp.dart';
import '../../../domain/resp_model/user_lending/record_list_resp.dart';
import '../interface/userbook_net_ds.dart';
import '../manage/network_manager.dart';

class UserBookNetDSImple extends UserBookNetDS {

  final Dio _userBookDio= NetworkManager.normalDio;
  late CancelToken _cancelToken;

  @override
  Future<Result<bool>> addBook(String isbn) {
    // TODO: implement addBook
    throw UnimplementedError();
  }

  @override
  Future<Result<List<BookShelfEle>>> getBookShelf({int? userId}) async {
    _cancelToken = CancelToken();
    try{
      Response response = await _userBookDio.get(
        NetworkPathCollector.bookShelf,
        options: NetworkConfig.json_json,
        data: userId != null ? {"user_id": userId} : {},
      );
      RespBody respBody=RespBody.fromJson(response.data);
      if(respBody.code==ResCode.SUCCESS){
        BookShelfResp bookShelf=BookShelfResp.fromJson(respBody.data);
        return Result.success(bookShelf.bookList);
      }else{
        return Result.abnormal(respBody.code);
      }
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
  @override
  Future<Result<List<LendingRecord>>> getRecordList(int offset, int num) async {
    _cancelToken = CancelToken();
    try{
      Response response = await _userBookDio.get(
        NetworkPathCollector.record,
        data: RecordListParam(
          offset: offset,
          num: num,
        ).toJson(),
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      if(respBody.code==ResCode.SUCCESS){
        RecordListResp recordListResp=RecordListResp.fromJson(respBody.data);
        return Result.success(recordListResp.recordList);
      }else{
        return Result.abnormal(respBody.code);
      }
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}