import 'package:elibrary/domain/resp_model/book_info/reserve_res_resp.dart';

import '../../../domain/util_model/res_info.dart';

abstract class UserBookReq{
  //book shelf
  Future<Result<bool>> addBookToShelf(String isbn);
  Future<Result<bool>> removeBookFromShelf(List<String> isbnList);
  // reserve
  Future<Result<ReserveResultResp>> reserveBook({required String isbn, required int libId, required DateTime dueTime});
}