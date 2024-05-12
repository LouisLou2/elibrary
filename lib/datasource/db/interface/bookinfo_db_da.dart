
import '../../../domain/entity/book_info.dart';
import '../../../domain/util_model/res_info.dart';

abstract class BookInfoDbDs {
  // 获取书籍信息
  Result<BookInfo> getBookInfo(String isbn);
  // 获取推荐书籍 不提供数据库接口，只提供网络接口
  // Result<List<BookInfo>> getRecoBooks(int offset, int num);
  Future<Result<bool>> saveBookInfo(BookInfo bookInfo);
}