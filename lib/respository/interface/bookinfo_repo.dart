// 用于获取任何关于书籍内容信息的repo接口
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../domain/entity/book_info.dart';

abstract class BookInfoRep {
  // 获取书籍信息
  Future<Result<BookInfo>> getBookInfo(String isbn);
  // 获取推荐书籍
  Future<Result<List<BookInfo>>> getRecoBooks({required int offset, required int num});
}