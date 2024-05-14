import 'package:elibrary/datasource/db/interface/state_db_ds.dart';
import 'package:elibrary/domain/entity/mark.dart';
import 'package:isar/isar.dart';

import '../../../domain/entity/user.dart';
import '../manage/db_manager.dart';

class StateDbDsImple implements StateDbDs {

  final db = DBManager.db; // invoke get function

  /*此表查找很快，先用同步获取的方法，之后出了性能问题再考虑异步或者isolate*/
  @override
  User? getLastLoginUser() {
    int? userId=DBManager.db.marks.where().findFirstSync()?.lastUserId;
    if(userId==null){
      return null;
    }
    return getUserById(userId);
  }

  /*此表查找很快，先用同步获取的方法，之后出了性能问题再考虑异步或者isolate*/
  @override
  User? getUserById(int userId) {
    return DBManager.db.users.where().userIdEqualTo(userId).findFirstSync();
  }

  @override
  Future<void> saveUser(User user) async {
    DBManager.db.writeTxn(() async {
      // final userInDb = await DBManager.db.users.where().userIdEqualTo(user.userId).findFirst();
      // if(userInDb!=null){
      //   user.id=userInDb.id;
      // }用于哪里唯一键加了replace:true, 会场僧覆盖而不是为一项约束异常，这里没必要查找原来的数据
      DBManager.db.users.put(user);
    });
  }

  @override
  Future<void> setDefaultUser(User user) async {
    DBManager.db.writeTxn(() async{
      final mark = await DBManager.db.marks.where().findFirst();
      if(mark==null){
        DBManager.db.marks.put(Mark(lastUserId: user.userId));
      }else{
        if(mark.lastUserId!=user.userId){
          mark.lastUserId=user.userId;
          DBManager.db.marks.put(mark);
        }
      }
    });
  }
}