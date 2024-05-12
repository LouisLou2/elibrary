import '../../../domain/entity/user.dart';

abstract class StateRep {
  User? getLastLoginUser();
  User? getUserById(int userId);
  Future<void> saveUser(User user);
  Future<void> setDefaultUser(User user);
}