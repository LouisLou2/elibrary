import 'package:flutter/material.dart';

enum AuthState {
  pwdLogIn, enterEmail, enterVerifyCode
}
class AuthProv with ChangeNotifier {
  AuthState _authState = AuthState.pwdLogIn;
  AuthState get authState => _authState;
  set authState(AuthState state) {
    _authState = state;
    notifyListeners();
  }
}