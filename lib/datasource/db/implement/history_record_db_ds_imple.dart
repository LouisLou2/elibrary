import 'package:elibrary/datasource/db/manage/db_manager.dart';
import 'package:elibrary/domain/entity/browsed_recently.dart';
import 'package:elibrary/domain/entity/keyword_record.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/helper/global_exception_helpe.dart';
import 'package:isar/isar.dart';

import '../interface/history_record_db_ds.dart';

class HistoryRecordDBDSImple extends HistoryRecordDbDs {
  final db = DBManager.db;
  @override
  Future<Result<bool>> saveSearchKeyword(String keyword) async {
    return db.writeTxn(() async {
      db.keywordRecords.put(KeywordRecord(
          keyword: keyword,
          lastSearchTime: DateTime.now(),
        ),
      );
      return Result.success(true);
    });
  }

  @override
  Future<Result<List<String>>> getSearchKeywords({required int num}) async {
    try{
      // 前num个搜索记录
      List<KeywordRecord> records = await  db.keywordRecords.where().sortByKeywordDesc().limit(num).findAll();
      return Result.success(List<String>.from(records.map((e) => e.keyword)));
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Result<bool>> clearSearchKeywords() async {
    try{
      return db.writeTxn(() async {
        db.keywordRecords.clear();
        return Result.success(true);
      });
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Result<List<String>>> getRecentBrowsedBooks({required int offset, required int num}) async{
    try{
      List<BrowsedRecently> res= await db.browsedRecentlys.where().sortByBrowseTimeDesc().offset(offset).limit(num).findAll();
      return Result.success(List<String>.from(res.map((e) => e.isbn)));
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Result<bool>> saveRecentBrowsedBook(String isbn) async {
    try{
      db.writeTxn(() async {
        db.browsedRecentlys.put(BrowsedRecently(
          isbn: isbn,
          browseTime: DateTime.now(),
        ));
       }
      );
      return Result.success(true);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}