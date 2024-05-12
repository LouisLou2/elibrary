import 'package:animations/animations.dart';
import 'package:elibrary/presentation/page/auth/sign_in.dart';
import 'package:elibrary/state_management/prov/auth_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'check_code_page.dart';
import 'enter_email_page.dart';

class AuthPages extends StatefulWidget{
  const AuthPages({super.key});

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  //使用它，可以在表单组件的外部使用表单状态

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ProvManager.authProv.reset();
    super.dispose();
  }

  Widget getPageByAuthState(AuthState state){
    switch(state){
      case AuthState.enterEmail:
        return const EnterEmailPage();
      case AuthState.enterVerifyCode:
        return const EnterVeriCodePage();
      case AuthState.pwdLogIn:
        return const SignInPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Selector<AuthProv, AuthState>(
        selector: (_, prov) => prov.authState,
        builder: (_, state, __) {
          return PageTransitionSwitcher(
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: getPageByAuthState(state),
          );
        },
      ),
    );
  }
}