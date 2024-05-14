import 'package:elibrary/domain/entity/book_shelf_ele.dart';
import 'package:elibrary/domain/resp_model/book_info/reserve_res_resp.dart';

import '../../domain/resp_model/user_lending/record_list_resp.dart';
import '../../domain/util_model/res_info.dart';

abstract class UserBookRep{
  Future<Result<List<BookShelfEle>>> getBookShelf({int? userId});
  // not here//Future<Result<ReserveResultResp>> reserveBook({required String isbn, required int libId, required DateTime dueTime});

  Future<Result<List<LendingRecord>>> getRecordList({required int offset, required int num});
}