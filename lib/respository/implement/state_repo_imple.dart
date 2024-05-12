import 'package:elibrary/datasource/db/interface/state_db_ds.dart';
import 'package:elibrary/domain/entity/user.dart';
import 'package:get_it/get_it.dart';
import '../interface/state_repo.dart';

class StateRepImple implements StateRep {

  StateDbDs stateDbDs = GetIt.I<StateDbDs>();

  /*此表查找很快，先用同步获取的方法，之后出了性能问题再考虑异步或者isolate*/
  @override
  User? getLastLoginUser() {
    return stateDbDs.getLastLoginUser();
  }

  /*此表查找很快，先用同步获取的方法，之后出了性能问题再考虑异步或者isolate*/
  @override
  User? getUserById(int userId) {
    return stateDbDs.getUserById(userId);
  }

  @override
  Future<void> saveUser(User user) async {
    stateDbDs.saveUser(user);
  }

  @override
  Future<void> setDefaultUser(User user) async {
    stateDbDs.setDefaultUser(user);
  }
}