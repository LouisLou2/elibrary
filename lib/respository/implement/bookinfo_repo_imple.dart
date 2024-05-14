import 'package:elibrary/datasource/db/interface/bookinfo_db_da.dart';
import 'package:elibrary/datasource/network/interface/bookinfo_net_ds.dart';
import 'package:elibrary/domain/entity/book.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/resp_model/book_info/search_resp.dart';
import 'package:elibrary/domain/resp_model/user_lending/record_list_resp.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/util_model/res_info.dart';
import '../../helper/global_exception_helpe.dart';
import '../interface/bookinfo_repo.dart';

class BookInfoRepImple implements BookInfoRep {

  BookInfoDbDs bookInfoDbDs = GetIt.I<BookInfoDbDs>();
  BookInfoNetDs bookInfoNetDs = GetIt.I<BookInfoNetDs>();

  @override
  Future<Result<BookInfo>> getBookInfo(String isbn) async{
    // 先尝试从数据库获取
    final res  = bookInfoDbDs.getBookInfo(isbn);
    if(res.resCode==ResCode.SUCCESS){
      return res;
    }
    // 从网络获取
    final netRes = await bookInfoNetDs.getBookDetail(isbn);
    if(netRes.resCode==ResCode.SUCCESS){
      // 保存到数据库
      bookInfoDbDs.saveBookInfo(netRes.data!); // 这一步就算出错也不会影响返回结果，故不管了
    }
    return netRes;
  }

  @override
  Future<Result<List<BookInfo>>> getRecoBooks({required int offset, required int num}) async{
    // 只从网络获取
    Result<List<BookInfo>> bookInfoRes = await bookInfoNetDs.getRecoBooks(offset, num);
    if(bookInfoRes.resCode==ResCode.SUCCESS){
      // 保存到数据库
      try{
        for (var bookinfo in bookInfoRes.data!) {
          bookInfoDbDs.saveBookInfo(bookinfo); // 这一步就算出错也不会影响返回结果，故不管了
        }
      }catch(e){
        // return GlobalExceptionHelper.getErrorResInfo(e);
        // 因为目前结果体系只有一个表示结果的code, 但是实际上可能有多个错误，所但是这里即使无法缓存，也不是大问题， 暂时忽视
      }
    }
    return bookInfoRes;
  }

  @override
  Future<Result<List<Owner>>> getBookOwners(String isbn) {
    // 只从网络获取
    return bookInfoNetDs.getBookOwners(isbn);
  }

  @override
  Future<Result<SearchResp>> search({required String keyword}) {
    return bookInfoNetDs.search(keyword);
  }
}