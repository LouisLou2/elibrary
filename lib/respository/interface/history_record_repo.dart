import 'package:elibrary/domain/entity/book_info.dart';

import '../../domain/util_model/res_info.dart';

abstract class HistoryRecordRep {
  // 保存搜索关键词
  Future<Result<bool>> saveSearchKeyword(String keyword);

  // 获取搜索关键词
  Future<Result<List<String>>> getSearchKeywords({required int num});

  // 清空搜索关键词
  Future<Result<bool>> clearSearchKeywords();

  Future<Result<List<BookInfo>>> getRecentBrowsedBooks({required int offset,required int num});

  Future<Result<bool>> saveRecentBrowsedBook(BookInfo bookInfo);
}