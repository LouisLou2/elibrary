import 'package:dio/dio.dart';
import 'package:elibrary/datasource/network/manage/network_config.dart';
import 'package:elibrary/datasource/network/manage/network_manager.dart';
import 'package:elibrary/domain/entity/book.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/resp_model/book_info/reco_books_resp.dart';
import 'package:elibrary/domain/resp_model/book_info/search_resp.dart';
import 'package:elibrary/domain/resp_model/user_book/book_owner_resp.dart';
import 'package:elibrary/domain/resp_model/user_lending/record_list_resp.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../constant/rescode.dart';
import '../../../domain/entity/author.dart';
import '../../../domain/req_model/book_info/reco_books_param.dart';
import '../../../domain/req_model/user_lend/record_list_param.dart';
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

  @override
  Future<Result<List<Owner>>> getBookOwners(String isbn) async {
    _cancelToken=CancelToken();
    try {
      Response response = await _bookInfoDio.get(
        NetworkPathCollector.owner,
        // 太过简单，就不单独写一个类了
        data: {
          'isbn':isbn,
        },
        options: NetworkConfig.json_json,
        cancelToken: _cancelToken,
      );
      RespBody respBody=RespBody.fromJson(response.data);
      if(respBody.code==ResCode.SUCCESS){
        BookOwnerResp bookOwnerResp=BookOwnerResp.fromJson(respBody.data);
        return Result.success(bookOwnerResp.owners);
      }else{
        return Result.abnormal(respBody.code);
      }
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Result<SearchResp>> search(String keyword) async {
    // _cancelToken=CancelToken();
    // try {
    //   Response response = await _bookInfoDio.get(
    //     NetworkPathCollector.search,
    //     // 太过简单，就不单独写一个类了
    //     data: {
    //       'keyword':keyword,
    //     },
    //     options: NetworkConfig.json_json,
    //     cancelToken: _cancelToken,
    //   );
    //   RespBody respBody=RespBody.fromJson(response.data);
    //   if(respBody.code==ResCode.SUCCESS){
    //     SearchResp searchResp=SearchResp.fromJson(respBody.data);
    //     return Result.success(searchResp);
    //   }else{
    //     return Result.abnormal(respBody.code);
    //   }
    // } catch (e) {
    //   return GlobalExceptionHelper.getErrorResInfo(e);
    // }
    //test data
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(SearchResp(
      authors: DateTime.now().second.isEven?[
        Author(
          authorId: 1,
          name: 'author1',
        ),
        Author(
          authorId: 2,
          name: 'author2',
        ),
      ]:[],
      publishers: [
        'publisher1',
        'publisher2',
      ],
      books:  List.generate(3, (index) =>
        BookInfo(
        isbn: '1234567890123',
        title: '示例书名',
        originalTitle: 'Example Original Title',
        authorIds: [1, 2],
        authorNames: ['作者一', '作者二'],
        publisher: '示例出版社',
        pubDate: DateTime(2024, 5, 14),
        wordCount: 50000,
        desc: '这是一本关于示例的书。',
        category1: 1,
        category2: 2,
        tags: ['示例', '教育', '非虚构'],
        cover_l_url: 'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
        cover_m_url: 'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
        cover_s_url: 'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
        ebook_url: 'http://example.com/ebook.pdf',
      ),
      ),
    ));
  }
}