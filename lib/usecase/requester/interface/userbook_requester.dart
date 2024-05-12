import '../../../domain/util_model/res_info.dart';

abstract class UserBookReq{
  Future<Result<bool>> addBookToShelf(String isbn);
  Future<Result<bool>> removeBookFromShelf(List<String> isbnList);
}