// 用于获取任何关于书籍内容信息的repo接口
import 'package:elibrary/domain/resp_model/book_info/search_resp.dart';
import 'package:elibrary/domain/resp_model/user_lending/record_list_resp.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../domain/entity/book.dart';
import '../../domain/entity/book_info.dart';
import '../../domain/resp_model/author_resp.dart';

enum DataSource{
  ONLY_NET,
  ONLY_DB,
  NET_FIRST,
  DB_FIRST,
}

abstract class BookInfoRep {
  // 获取书籍信息
  Future<Result<BookInfo>> getBookInfo(String isbn);
  // 获取书籍owner信息
  Future<Result<List<Owner>>> getBookOwners(String isbn);
  // 获取推荐书籍

  Future<Result<List<BookInfo>>> getRecoBooks({required int offset, required int num, required DataSource dataSource});

  Future<Result<bool>> saveAfewRecoBooks(List<BookInfo> books);

  Future<Result<SearchResp>> search({required String keyword,});

  Future<Result<List<BookInfo>>> getBooksByCategory({required int category1, required int category2, required int offset, required int num, bool onlyNet=false});

  Future<Result<AuthorResp>> getAuthorInfo({required int authorId, required int withBookNum});
}