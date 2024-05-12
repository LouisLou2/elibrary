import 'package:elibrary/datasource/network/interface/userbook_net_ds.dart';
import 'package:elibrary/domain/entity/book_shelf_ele.dart';

import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:get_it/get_it.dart';

import '../interface/user_book_repo.dart';

class UserBookRepImple implements UserBookRep{

  UserBookNetDS userBookNetDS = GetIt.I<UserBookNetDS>();

  @override
  Future<Result<List<BookShelfEle>>> getBookShelf()async {
    return userBookNetDS.getBookShelf();
  }
}