import 'package:elibrary/domain/entity/book_shelf_ele.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

import '../../../domain/resp_model/user_lending/record_list_resp.dart';

abstract class UserBookNetDS {
  Future<Result<List<BookShelfEle>>> getBookShelf({int? userId});
  Future<Result<bool>> addBook(String isbn);
  Future<Result<List<LendingRecord>>> getRecordList(int offset, int num);
}