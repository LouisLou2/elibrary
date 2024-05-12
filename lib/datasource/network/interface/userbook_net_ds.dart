import 'package:elibrary/domain/entity/book_shelf_ele.dart';
import 'package:elibrary/domain/util_model/res_info.dart';

abstract class UserBookNetDS {
  Future<Result<List<BookShelfEle>>> getBookShelf();
  Future<Result<bool>> addBook(String isbn);
}