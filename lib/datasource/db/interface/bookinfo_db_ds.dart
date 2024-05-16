
import '../../../domain/entity/book_info.dart';
import '../../../domain/util_model/res_info.dart';

abstract class BookInfoDbDs {
  // 获取书籍信息
  Result<BookInfo> getBookInfo(String isbn);
  // 获取推荐书籍 不提供数据库接口，只提供网络接口
  // Result<List<BookInfo>> getRecoBooks(int offset, int num);
  Future<Result<bool>> saveBookInfo(BookInfo bookInfo);
  Future<void> updateCateBookInfo({required int category1, required int category2, required List<BookInfo> bookInfos});
  Future<Result<List<BookInfo>>> getDefCategoryBooks({required int category1, required int category2});

  // 用于即使网络出错， 首页不会太空
  Future<Result<bool>> saveAfewRecoBooks(List<BookInfo> books);
  Future<Result<List<BookInfo>>> getRecoBooks({required int num});
}