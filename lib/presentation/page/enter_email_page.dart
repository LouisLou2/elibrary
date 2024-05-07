import 'package:elibrary/state_management/auth_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_strings.dart';
import '../../util/format_util.dart';
import '../widget/named_divider.dart';

class EnterEmailPage extends StatefulWidget{
  const EnterEmailPage({super.key});

  @override
  State<EnterEmailPage> createState() => _EnterEmailPageState();
}

class _EnterEmailPageState extends State<EnterEmailPage> {
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
    return PopScope(
      canPop: false,
      onPopInvoked: (bool _)=>ProvManager.authProv.authState=AuthState.pwdLogIn,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: ()=>ProvManager.authProv.authState=AuthState.pwdLogIn,
            ),
          ),
          body:Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w,vertical: 4.h),
            child:ListView(
              padding: EdgeInsets.only(top: 120.h),
              children: [
                Align(
                  child: Text(
                    '请输入学校邮箱',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: UIParams.hugeGap.h,),
                Form(
                  key:_formKey,
                  child: Padding(
                    padding: EdgeInsets.all(UIParams.defPadding.w),
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
                        SizedBox(height: UIParams.largeGap.h,),
                        _buildButton(
                          text: '发送验证码',
                          onPressed: ()=>ProvManager.authProv.authState=AuthState.enterVerifyCode,
                          backgroundColor: CupertinoColors.systemBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
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