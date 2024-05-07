import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_strings.dart';
import '../../util/format_util.dart';
import '../widget/named_divider.dart';

class SignInPage extends StatefulWidget{
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //使用它，可以在表单组件的外部使用表单状态
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> pwdVisibleNotifier = ValueNotifier(true);
  late final TextEditingController idenController;
  late final TextEditingController pwdController;

  late int lastTime;

  String? emailTip;
  String? pwdTip;

  @override
  void initState() {
    lastTime=0;
    emailTip=pwdTip=null;
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void initializeControllers() {
    //listener在文本更改时会被调用
    idenController = TextEditingController()
      ..addListener(validateAllThrottle);
    pwdController = TextEditingController()
      ..addListener(validateAllThrottle);
  }

  void disposeControllers() {
    idenController.dispose();
    pwdController.dispose();
  }

  void validateAllThrottle(){
    int now = DateTime.now().millisecondsSinceEpoch;
    if(now-lastTime< 300)return;
    lastTime=now;
    _formKey.currentState?.validate();
  }

  // 此方法最后调用
  bool allFieldValid(){
    return _formKey.currentState?.validate()??false;
  }


  String? validatePwd(String? value){
    if(value==null||value.isEmpty){
      emailTip= AppStrs.pleaseEnterPassword;
    }else if(!FormatTool.isPwdValid(value)){
      emailTip=AppStrs.invalidPassword;
    }else{
      emailTip=null;
    }
    return emailTip;
  }

  String? validateEmail(String? value){
    if(value==null||value.isEmpty){
      pwdTip= AppStrs.pleaseEnterEmail;
    }else if(!FormatTool.isEmailValid(value)){
      pwdTip= AppStrs.invalidEmail;
    }else{
      pwdTip=null;
    }
    return pwdTip;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 18.w,vertical: 4.h),
        child:ListView(
          padding: EdgeInsets.only(top: 120.h),
          children: [
            Align(
              child: Text(
                '使用学校邮箱登录',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: UIParams.hugeGap.h,),
            Form(
              key:_formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppStrs.schoolEmail,
                        hintText: AppStrs.schoolEmail,
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: false,
                        prefixIconColor: Theme.of(context).colorScheme.primary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: idenController,
                      validator: validateEmail,
                    ),
                    SizedBox(height: UIParams.mediumGap.h),
                    ValueListenableBuilder(
                      valueListenable: pwdVisibleNotifier,
                      builder: (_, pwdObscure, __)=>TextFormField(
                        obscureText: pwdObscure,
                        controller: pwdController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        //onChanged: (_) => _formKey.currentState?.validate(),
                        decoration: InputDecoration(
                          labelText: AppStrs.password,
                          hintText: AppStrs.password,
                          prefixIcon: const Icon(CupertinoIcons.lock),
                          prefixIconColor: Theme.of(context).colorScheme.primary,
                          filled: false,
                          suffixIcon: IconButton(
                            icon: Icon(
                              pwdObscure ? Icons.visibility : Icons.visibility_off,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () => pwdVisibleNotifier.value = !pwdObscure,
                          ),
                        ),
                        validator: validatePwd,
                      ),
                    ),
                    SizedBox(height: 150.h,),
                    _buildButton(
                      text: '登录',
                      onPressed: () { },
                      backgroundColor: CupertinoColors.systemBlue,
                    ),
                    SizedBox(height: 20.h,),
                    _buildButton(
                      text: '使用邮箱验证码',
                      onPressed: () { },
                      backgroundColor: Theme.of(context).focusColor,
                      textColor: CupertinoColors.systemBlue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            AppStrs.forgotPassword,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: CupertinoColors.systemBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: UIParams.smallGap.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '* 首次登录请使用邮箱验证码',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  // logic
  String makeTip(){
    return '${emailTip!=null?'$emailTip; ':''}${pwdTip!=null?'$pwdTip; ':''}${pwdTip!=null?AppStrs.passwordRules:''}';
  }

  void signInPressed() async {
    if(allFieldValid()) {

    }
    else{

    }
  }

  Widget _buildButton({required String text,required VoidCallback onPressed, Color? backgroundColor, Color? textColor}){
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor??Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: textColor?? Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}