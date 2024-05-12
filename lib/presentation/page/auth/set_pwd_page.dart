import 'package:elibrary/presentation/widget/button_getter.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../../../util/format_util.dart';

class SetPwdPage extends StatefulWidget{
  const SetPwdPage({super.key});

  @override
  State<SetPwdPage> createState() => _SetPwdPageState();
}

class _SetPwdPageState extends State<SetPwdPage> {
  //使用它，可以在表单组件的外部使用表单状态
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> pwdVisibleNotifier = ValueNotifier(true);
  late final TextEditingController pwdController;

  late int lastTime;
  String? pwdTip;

  @override
  void initState() {
    lastTime=0;
    pwdTip=null;
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
    pwdController = TextEditingController()
      ..addListener(validateAllThrottle);
  }

  void disposeControllers() {
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
      pwdTip = AppStrs.pleaseEnterPassword;
    }else if(!FormatTool.isPwdValid(value)){
      pwdTip =AppStrs.invalidPassword;
    }else{
      pwdTip=null;
    }
    return pwdTip;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: (){},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: UIParams.mediumGap.w),
              child: Text(
                '跳过',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18.w,vertical: 4.h),
          padding: EdgeInsets.only(top: 120.h),
          child: Column(
            children: [
              Align(
                child: Text(
                  AppStrs.setPwd,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: UIParams.hugeGap.h,),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:[
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
                                size: 20.sp,
                              ),
                              onPressed: () => pwdVisibleNotifier.value = !pwdObscure,
                            ),
                          ),
                          validator: validatePwd,
                        ),
                      ),
                      SizedBox(height: UIParams.hugeGap.h,),
                      getCustomFilledButton(
                        context: context,
                        text: AppStrs.signIn,
                        onPressed: () { },
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
    );
  }


  void signInPressed() async {
    if(allFieldValid()) {

    }
    else{

    }
  }
}