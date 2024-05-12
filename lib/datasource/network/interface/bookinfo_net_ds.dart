import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../domain/entity/book_info.dart';

abstract class BookInfoNetDs {
  // 获取书籍信息
  Future<Result<BookInfo>> getBookDetail(String isbn);
  // 获取推荐书籍
  Future<Result<List<BookInfo>>> getRecoBooks(int offset, int num);
}