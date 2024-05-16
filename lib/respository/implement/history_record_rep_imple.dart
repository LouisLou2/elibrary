import 'package:elibrary/datasource/db/interface/history_record_db_ds.dart';
import 'package:elibrary/datasource/network/interface/bookinfo_net_ds.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/respository/interface/bookinfo_repo.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../datasource/db/interface/bookinfo_db_ds.dart';
import '../interface/history_record_repo.dart';

class HistoryRecordRepImple implements HistoryRecordRep {

  final HistoryRecordDbDs historyRecordDbDs = GetIt.I<HistoryRecordDbDs>();
  final BookInfoDbDs bookInfoDbDs = GetIt.I<BookInfoDbDs>();
  final BookInfoNetDs bookInfoNetDs = GetIt.I<BookInfoNetDs>();
  final BookInfoRep bookInfoRep = GetIt.I<BookInfoRep>();

  @override
  Future<Result<bool>> clearSearchKeywords() {
     return historyRecordDbDs.clearSearchKeywords();
  }

  @override
  Future<Result<List<String>>> getSearchKeywords({required int num}) {
    return historyRecordDbDs.getSearchKeywords(num: num);
  }

  @override
  Future<Result<bool>> saveSearchKeyword(String keyword) {
    return historyRecordDbDs.saveSearchKeyword(keyword);
  }

  @override
  Future<Result<List<BookInfo>>> getRecentBrowsedBooks({required int offset,required int num}) async{
    Result<List<String>> isbnListRes= await historyRecordDbDs.getRecentBrowsedBooks(offset: offset, num: num);
    if(isbnListRes.resCode!=ResCode.SUCCESS){
      return Result.abnormal(isbnListRes.resCode);
    }
    List<String> isbnList=isbnListRes.data??[];
    List<BookInfo> bookInfoList=[];
    for(String isbn in isbnList){
      Result<BookInfo> bookInfoRes= await bookInfoRep.getBookInfo(isbn);
      if(bookInfoRes.resCode==ResCode.SUCCESS){
        bookInfoList.add(bookInfoRes.data!);
      }
    }
    return Result.success(bookInfoList);
  }

  @override
  Future<Result<bool>> saveRecentBrowsedBook(BookInfo bookInfo) {
    return historyRecordDbDs.saveRecentBrowsedBook(bookInfo.isbn);
  }
}