import 'package:elibrary/domain/resp_model/user_lending/record_list_resp.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../domain/entity/book.dart';
import '../../../domain/entity/book_info.dart';
import '../../../domain/resp_model/book_info/search_resp.dart';

abstract class BookInfoNetDs {
  // 获取书籍信息
  Future<Result<BookInfo>> getBookDetail(String isbn);
  // 获取书籍owner信息
  Future<Result<List<Owner>>> getBookOwners(String isbn);
  // 获取推荐书籍
  Future<Result<List<BookInfo>>> getRecoBooks(int offset, int num);

  Future<Result<SearchResp>> search(String keyword);
}