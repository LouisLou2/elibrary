import 'package:elibrary/datasource/db/interface/bookinfo_db_da.dart';
import 'package:elibrary/datasource/network/interface/bookinfo_net_ds.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/util_model/res_info.dart';
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
  Future<Result<List<BookInfo>>> getRecoBooks({required int offset, required int num}) {
    // 只从网络获取
    return bookInfoNetDs.getRecoBooks(offset, num);
  }
  
}