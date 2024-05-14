import 'package:elibrary/datasource/network/interface/user_lend_net_ds.dart';
import 'package:elibrary/domain/entity/simple_user.dart';

import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:get_it/get_it.dart';

import '../interface/user_lend_repo.dart';

class UserLendRepImple implements UserLendRep {

  UserLendNetDs userLendNetDs = GetIt.I<UserLendNetDs>();

  @override
  Future<Result<List<SimpleUser>>> getBookOwners({required String isbn, required int offset, required int num}) async {
    return userLendNetDs.getBookOwners(isbn: isbn, offset: offset, num: num);
  }
  @override
  Future<Result<List<SimpleUser>>> getUserInfo({required List<int> userIds}) {
    return userLendNetDs.getUserInfo(userIds: userIds);
  }
}