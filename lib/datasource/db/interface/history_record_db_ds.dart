import '../../../domain/util_model/res_info.dart';

abstract class HistoryRecordDbDs {

  Future<Result<bool>> saveSearchKeyword(String keyword);

  Future<Result<List<String>>> getSearchKeywords({required int num});

  // 清空
  Future<Result<bool>> clearSearchKeywords();

  Future<Result<List<String>>> getRecentBrowsedBooks({required int offset,required int num});

  Future<Result<bool>> saveRecentBrowsedBook(String isbn);
}