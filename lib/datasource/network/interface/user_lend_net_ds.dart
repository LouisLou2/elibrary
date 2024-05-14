import '../../../domain/entity/simple_user.dart';
import '../../../domain/util_model/res_info.dart';

abstract class UserLendNetDs{
  // 获取拥有此本书的用户列表
  Future<Result<List<SimpleUser>>> getBookOwners({required String isbn, required int offset, required int num});
  Future<Result<List<SimpleUser>>> getUserInfo({required List<int> userIds});
}