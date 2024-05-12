// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:elibrary/datasource/network/manage/network_config.dart';
import 'package:elibrary/domain/entity/user.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/usecase/requester/implement/auth_requester_imple.dart';
import 'package:elibrary/usecase/requester/interface/auth_requester.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:elibrary/main.dart';

void main() async{
  await testAuth();
}
Future<void> testAuth() async {
  ProvManager.init();
  NetworkConfig.init();

  AuthReq authReq=AuthRequesterImple();
  String email='8209220125@csu.edu.cn';

  Result<bool> reqCodeRes= await authReq.requestEmailCode(email);
  // read email code from console
  String code= '345778';
  Result<User> userRes = await authReq.loginWithEmailCode(email, code);
  // begin set pwd
  String password='abc123';
  Result<bool> setPedRes= await authReq.firstSetPwd(email,password);
  // begin login
  Result<User> loginRes= await authReq.loginWithEmailPwd(email, password);
  print('loginRes: $loginRes');
}
void uiTestExample(){
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
