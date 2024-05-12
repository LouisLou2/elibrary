import 'package:dio/dio.dart';
import 'package:elibrary/datasource/network/manage/network_config.dart';
import 'package:elibrary/datasource/network/manage/network_manager.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/resp_model/book_info/reco_books_resp.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../constant/rescode.dart';
import '../../../domain/req_model/book_info/reco_books_param.dart';
import '../../../domain/resp_model/resp_body.dart';
import '../../../helper/global_exception_helpe.dart';
import '../interface/bookinfo_net_ds.dart';
import '../manage/network_path_collector.dart';

class BookInfoNetDsImple implements BookInfoNetDs{

  final Dio _bookInfoDio= NetworkManager.normalDio;
  late CancelToken _cancelToken;

  @override
  Future<Result<BookInfo>> getBookDetail(String isbn) async {
    _cancelToken=CancelToken();
    try {
      Response response = await _bookInfoDio.get(
        NetworkPathCollector.bookDetail,
        // 太过简单，就不单独写一个类了
        data: {
          'isbn':isbn,
        },
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      if(respBody.code==ResCode.SUCCESS){
        BookInfo bookInfo=BookInfo.fromJson(respBody.data['book_info']);
        return Result.success(bookInfo);
      }else{
        return Result.abnormal(respBody.code);
      }
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo<BookInfo>(e);
    }
  }

  @override
  Future<Result<List<BookInfo>>> getRecoBooks(int offset, int num) async {
    _cancelToken=CancelToken();
    try {
      Response response = await _bookInfoDio.get(
        NetworkPathCollector.recoBook,
        data: RecoParam(
          offset: offset,
          num: num,
        ).toJson(),
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      if(respBody.code==ResCode.SUCCESS){
        RecoResp recoResp=RecoResp.fromJson(respBody.data);
        return Result.success(recoResp.bookInfos);
      }else{
        return Result.abnormal(respBody.code);
      }
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo<List<BookInfo>>(e);
    }
  }
}