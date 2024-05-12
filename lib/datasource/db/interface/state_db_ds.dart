
import '../../../domain/entity/user.dart';

abstract class StateDbDs {
  User? getLastLoginUser();
  User? getUserById(int userId);
  Future<void> saveUser(User user);
  Future<void> setDefaultUser(User user);
}