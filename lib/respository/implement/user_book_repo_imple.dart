import 'package:elibrary/datasource/network/interface/userbook_net_ds.dart';
import 'package:elibrary/domain/entity/book_shelf_ele.dart';
import 'package:elibrary/domain/resp_model/book_info/reserve_res_resp.dart';

import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:get_it/get_it.dart';

import '../../domain/resp_model/user_lending/record_list_resp.dart';
import '../interface/user_book_repo.dart';

class UserBookRepImple implements UserBookRep{

  UserBookNetDS userBookNetDS = GetIt.I<UserBookNetDS>();

  @override
  Future<Result<List<BookShelfEle>>> getBookShelf({int? userId}) async {
    return userBookNetDS.getBookShelf(userId: userId);
  }

  @override
  Future<Result<List<LendingRecord>>> getRecordList({required int offset, required int num})async {
    return userBookNetDS.getRecordList(offset, num);
  }
}