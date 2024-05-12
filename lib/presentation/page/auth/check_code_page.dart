import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../state_management/prov/auth_prov.dart';
import '../../../state_management/prov_manager.dart';
import '../../../state_management/prov/veri_code_prov.dart';
import '../../../util/format_util.dart';
import '../../widget/info_display/headline2.dart';

class EnterVeriCodePage extends StatefulWidget{

  const EnterVeriCodePage({super.key,});
  @override
  State<EnterVeriCodePage> createState()=>_EnterVeriCodePageState();
}

class _EnterVeriCodePageState extends State<EnterVeriCodePage> with WidgetsBindingObserver{

  final TextEditingController _controller = TextEditingController();
  late FocusNode _inputFocus;
  VeriCodeProv vprov = ProvManager.veriCodeProv;

  @override
  void initState(){
    _inputFocus = FocusNode();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inputFocus.requestFocus();
      ProvManager.veriCodeProv.startTimer();
      ProvManager.veriCodeProv.allowNext(false);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    vprov = ProvManager.veriCodeProv;
    if(state==AppLifecycleState.resumed){
      vprov.considerPause();
    }
    else if(state==AppLifecycleState.paused){
      vprov.noteNowAsPause();
    }
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _inputFocus.dispose();
    ProvManager.veriCodeProv.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return PopScope(
      canPop: false,
      onPopInvoked: (bool _)=>ProvManager.authProv.authState=AuthState.enterEmail,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: ()=>ProvManager.authProv.authState=AuthState.enterEmail,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: UIParams.largeGap.h),
              HeadLine2(
                title: '请输入验证码',
                size: 30.sp,
                subTitle: '验证码已发送到 865113609@qq.com',
              ),
              SizedBox(height: UIParams.mediumGap.h),
              _getCodeInput(context),
              GestureDetector(
                onTap: (){
                  SystemChannels.textInput.invokeMethod('TextInput.show');
                  _inputFocus.requestFocus();
                },
                child: _getCodeBoxes(context),
              ),
              SizedBox(height: UIParams.smallGap.h),
              Selector<VeriCodeProv,bool>(
                selector: (_,prov)=>prov.allowNextSend,
                builder: (_,restart,__)=>restart?TextButton(
                  onPressed: sendAgain,
                  child: Text(
                    '重新发送',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ):Selector<VeriCodeProv,int>(
                  selector: (_,prov)=>prov.left,
                  builder: (_,left,__)=>Text(
                    '$left 秒后重新发送',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCodeInput(BuildContext context){
    return SizedBox(
      height: 0,
      width: 0,
      child: TextField(
        controller: _controller,
        focusNode: _inputFocus,
        maxLength: 6,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: false,// 禁止长按弹出菜单
        inputFormatters: [
          FilteringTextInputFormatter.allow(FormatTool.onlyNumberRegex),
        ],
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: tyingCode,
      ),
    );
  }
  Widget _getCodeBoxes(BuildContext context){
    return GridView.count(
      crossAxisCount: 6,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 8.w,
      childAspectRatio: 0.95,
      children: List.generate(
        6,
          (index) => Selector<VeriCodeProv,int>(
          selector: (_,prov)=>prov.index,
          builder: (_,ind,__)=>Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: ind==index?Border.all(
                width: UIParams.smallBoxBorderW,
                color: Theme.of(context).colorScheme.primary,
              ):null,
              borderRadius: BorderRadius.circular(UIParams.smallBorderR),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: vprov.getCharAt(index)!='a'?Text(
              vprov.getCharAt(index),
              style: Theme.of(context).textTheme.headlineLarge,
            ):const SizedBox(),
          ),
        ),
      ),
    );
  }
  void tyingCode(String code){
    vprov.setVeriCode = code;
    if(code.length==6){
      AuthHandler.logInWithCodeAndTmpEmail(
        vprov.getVeriCode,
      );
    }
  }
  void sendAgain(){
    AuthHandler.reqEmailCodeWithTmpEmail();
  }
}