import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/state_management/prov/auth_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../../../util/format_util.dart';
import '../../widget/button_getter.dart';

class EnterEmailPage extends StatefulWidget{
  const EnterEmailPage({super.key});

  @override
  State<EnterEmailPage> createState() => _EnterEmailPageState();
}

class _EnterEmailPageState extends State<EnterEmailPage> {
  //使用它，可以在表单组件的外部使用表单状态
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController idenController;

  late int lastTime;

  String? emailTip;

  @override
  void initState() {
    initializeControllers();
    lastTime=0;
    emailTip=null;
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
  }

  void disposeControllers() {
    idenController.dispose();
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
  String? validateEmail(String? value){
    if(value==null||value.isEmpty){
      emailTip= AppStrs.pleaseEnterEmail;
    }else if(!FormatTool.isEmailValid(value)){
      emailTip= AppStrs.invalidEmail;
    }else{
      emailTip=null;
    }
    return emailTip;
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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w,vertical: 4.h),
            padding: EdgeInsets.only(top: 120.h),
            child:Column(
              children: [
                Align(
                  child: Text(
                    AppStrs.enterSchoolEmail,
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
                        getCustomFilledButton(
                          context: context,
                          text: AppStrs.sendCode,
                          onPressed: submitEmail,
                          backgroundColor: CupertinoColors.systemBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitEmail() async {
    if(allFieldValid()) {
      ProvManager.authProv.authState=AuthState.enterVerifyCode;
      AuthHandler.reqEmailCode(
        email: idenController.text,
        ifSuccess: ()=>ProvManager.authProv.authState=AuthState.enterVerifyCode,//ifSuccess
      );
    }
    else{
      ToastHelper.showWarningWithouDesc(AppStrs.invalidEmail);
    }
  }
}