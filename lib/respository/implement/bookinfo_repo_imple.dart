import 'package:elibrary/constant/data_enum.dart';
import 'package:elibrary/datasource/db/interface/bookinfo_db_ds.dart';
import 'package:elibrary/datasource/network/interface/bookinfo_net_ds.dart';
import 'package:elibrary/domain/entity/book.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/resp_model/author_resp.dart';
import 'package:elibrary/domain/resp_model/book_info/search_resp.dart';
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
  Future<Result<List<Owner>>> getBookOwners(String isbn) {
    // 只从网络获取
    return bookInfoNetDs.getBookOwners(isbn);
  }

  @override
  Future<Result<SearchResp>> search({required String keyword}) {
    return bookInfoNetDs.search(keyword);
  }

  @override
  Future<Result<List<BookInfo>>> getBooksByCategory({required int category1, required int category2, required int offset, required int num, bool onlyNet=false}) async {
    Future<Result<List<BookInfo>>> fres = bookInfoNetDs.getBooksByCategory(category1: category1, category2: category2, offset: offset, num: num);
    if(onlyNet){
      return fres;
    }
    Result<List<BookInfo>> res = await fres;
    if(res.resCode==ResCode.SUCCESS){
      // 说明这次网络请求也成功了
      if(offset==0) {
        // 说明是第一页，需要清空原来的数据
        bookInfoDbDs.updateCateBookInfo(category1: category1, category2: category2, bookInfos: res.data!);
      }
      return res;
    }
    // 说明网络请求失败了，尝试从数据库获取
    final dbRes = bookInfoDbDs.getDefCategoryBooks(category1: category1, category2: category2);
    return dbRes;
  }

  @override
  Future<Result<AuthorResp>> getAuthorInfo({required int authorId, required int withBookNum}) {
    return bookInfoNetDs.getAuthorInfo(authorId: authorId, withBookNum: withBookNum);
  }

  @override
  Future<Result<bool>> saveAfewRecoBooks(List<BookInfo> books) {
    return bookInfoDbDs.saveAfewRecoBooks(books);
  }

  @override
  Future<Result<List<BookInfo>>> getRecoBooks({required int offset, required int num, required DataSource dataSource}) async{
   switch(dataSource) {
     case DataSource.ONLY_NET:
       {
         Result<List<BookInfo>> bookInfoRes = await bookInfoNetDs.getRecoBooks(offset, num);
         if (bookInfoRes.resCode == ResCode.SUCCESS) {
           // 保存到数据库
           try {
             for (var bookinfo in bookInfoRes.data!) {
               bookInfoDbDs.saveBookInfo(bookinfo); // 这一步就算出错也不会影响返回结果，故不管了
             }
           } catch (e) {
             // return GlobalExceptionHelper.getErrorResInfo(e);
             // 因为目前结果体系只有一个表示结果的code, 但是实际上可能有多个错误，所但是这里即使无法缓存，也不是大问题， 暂时忽视
           }
           bookInfoDbDs.saveAfewRecoBooks(bookInfoRes.data!); // 将推荐书籍保存到数据库，以备下次异常时获取
         }
         return bookInfoRes;
       }
     case DataSource.ONLY_DB:
       return bookInfoDbDs.getRecoBooks(num: num);
     case DataSource.NET_FIRST:
       {
         Result<List<BookInfo>> bookInfoRes = await bookInfoNetDs.getRecoBooks(offset, num);
         if (bookInfoRes.resCode == ResCode.SUCCESS) {
           // 保存到数据库
           try {
             for (var bookinfo in bookInfoRes.data!) {
               bookInfoDbDs.saveBookInfo(bookinfo); // 这一步就算出错也不会影响返回结果，故不管了
             }
           } catch (e) {
             // return GlobalExceptionHelper.getErrorResInfo(e);
             // 因为目前结果体系只有一个表示结果的code, 但是实际上可能有多个错误，所但是这里即使无法缓存，也不是大问题， 暂时忽视
           }
           bookInfoDbDs.saveAfewRecoBooks(bookInfoRes.data!); // 将推荐书籍保存到数据库，以备下次异常时获取
         }
         if (bookInfoRes.resCode != ResCode.SUCCESS) {
           // 说明网络请求失败了，并且允许从数据库，则先尝试从数据库获取
           final dbRes = bookInfoDbDs.getRecoBooks(num: num);
           return dbRes;
         }
         return bookInfoRes;
       }
     case DataSource.DB_FIRST:
     //这个基本不用
      {
        final dbRes = await bookInfoDbDs.getRecoBooks(num: num);
        if (dbRes.resCode == ResCode.SUCCESS) {
          return dbRes;
        }
        // 说明数据库获取失败，尝试从网络获取
        return bookInfoNetDs.getRecoBooks(offset, num);
      }
    }
  }
}