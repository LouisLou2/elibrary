import 'package:elibrary/domain/entity/book_shelf_ele.dart';

import '../../domain/util_model/res_info.dart';

abstract class UserBookRep{
  Future<Result<List<BookShelfEle>>> getBookShelf();
}