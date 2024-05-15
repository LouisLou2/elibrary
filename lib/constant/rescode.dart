import 'package:elibrary/constant/situation_enum.dart';

import '../domain/util_model/notification.dart';

class ResCode{
  static const int SUCCESS=0; //一切的成功状态码，无论是网络请求成功，还是业务逻辑成功

  // 客户端业务层面状态码，为了和后端错开，前端的状态码从800开始
  // 800-820用于开发阶段，生产环境忽视
  static const int DEBUG_ERROR=800; //调试错误
  // 821-840用于用户认证相关的状态码
  static const int CLIENT_LOGIN_EXPIRED=821; //登录过期
  // 841-860用于网络请求
  static const int USER_CANCELED=1001; //用户取消了请求
  static const int REQUEST_TIME_OUT=1002; //请求超时
  static const int REQUEST_ERROR=1002; //请求错误
  static const int CANNOT_CONNECT=1003; //无法连接到服务器
  // 861-880用于文件与数据库操作
  static const int DB_DATA_NOT_EXIST=861; //数据库中未找到该数据,
  static const int FILE_NOT_EXIST=862; //文件不存在
  static const int FILE_ERROR=863; //文件读取或写入错误
  static const int DB_NOT_EXIST=864; //数据库不存在
  static const int DB_ERROR=865; //数据库读取或写入错误
  static const int DATA_DAMAGE=866; //数据损坏
  // 881-900用于数据情况
  static const int DATA_NOT_NEW=881; //数据期待从网络获取，但是获取错误，得到了从数据库预留的数据，即使有数据，这不是期待的数据


  // 服务端返回的各种状态码
  //1-20为服务端与业务无关的代码
  static const int SERVER_ERROR=1; //服务端内部错误
  static const int SERVER_BUSY=2; //服务端繁忙
  static const int SERVER_MAINTAIN=3; //服务端维护中
  static const int REJECT_REQUEST=4; //拒绝请求
  //21-50为用户认证相关的状态码
  static const int USER_ALREADY_EXIST=21; //用户已存在
  static const int USER_NOT_EXIST=22; //用户不存在
  static const int USER_PWD_UNSET=23; //用户密码未设置,仅仅用在邮箱验证码登录成功后，而不会在其他情况下提醒用户
  static const int USER_PWD_ERROR=24; //用户密码错误
  static const int USER_EMAIL_CODE_ERROR=25; //用户邮箱验证码错误或已经过期
  static const int USER_LOGIN_EXPIRED=26; //登录过期
  static const int USER_REJECT=27; //用户被拒绝服务，此码没有原因，一般不用，具体业务会有更加详细的原因码
  static const int UER_EMAIL_CODE_UNSEND=28; //用户邮箱验证码未发送成功

  static const unknownNotification=AppNotification(
    situaCode: SituationEnum.ERROR,
    title: '未知错误',
    desc: '未知错误',
  );

  static Map<int,AppNotification> resCodeMap={
    // SUCCESS
    SUCCESS: AppNotification(
      situaCode: SituationEnum.SUCCESS,
      title: '成功',
    ),
    // CLIENT
    DEBUG_ERROR:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '调试错误',
      desc: '调试错误',
    ),
    CLIENT_LOGIN_EXPIRED: AppNotification(
      situaCode: SituationEnum.WARNING,
      title: '登录过期',
      desc: '登录过期，请重新登录',
    ),
    USER_CANCELED:AppNotification(
      situaCode: SituationEnum.WARNING,
      title: '用户取消',
      desc: '用户取消了请求',
    ),
    REQUEST_TIME_OUT:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '请求超时',
      desc: '请求超时',
    ),
    REQUEST_ERROR:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '请求错误',
      desc: '请求错误',
    ),
    CANNOT_CONNECT:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '无法连接',
      desc: '无法连接到服务器',
    ),
    FILE_NOT_EXIST:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '文件不存在',
      desc: '文件不存在',
    ),
    FILE_ERROR:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '文件错误',
      desc: '文件读取或写入错误',
    ),
    DB_NOT_EXIST:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '数据库不存在',
      desc: '数据库不存在',
    ),
    DB_ERROR:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '数据库错误',
      desc: '数据库读取或写入错误',
    ),
    DATA_DAMAGE:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '数据损坏',
      desc: '数据损坏',
    ),
    SERVER_ERROR:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '服务端错误',
      desc: '服务端内部错误',
    ),
    SERVER_BUSY:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '服务端繁忙',
      desc: '服务端繁忙',
    ),
    SERVER_MAINTAIN:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '服务端维护中',
      desc: '服务端维护中',
    ),
    REJECT_REQUEST:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '拒绝请求',
      desc: '拒绝请求',
    ),
    USER_ALREADY_EXIST:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '用户已存在',
      desc: '用户已存在',
    ),
    USER_NOT_EXIST:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '用户不存在',
      desc: '用户不存在',
    ),
    USER_PWD_UNSET:AppNotification(
      situaCode: SituationEnum.WARNING,
      title: '用户密码未设置',
      desc: '用户密码未设置',
    ),
    USER_PWD_ERROR:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '用户密码错误',
      desc: '用户密码错误',
    ),
    USER_EMAIL_CODE_ERROR:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '邮箱验证码错误',
      desc: '邮箱验证码错误或已经过期',
    ),
    USER_LOGIN_EXPIRED:AppNotification(
      situaCode: SituationEnum.WARNING,
      title: '登录过期',
      desc: '登录过期',
    ),
    USER_REJECT:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '用户被拒绝',
      desc: '用户被拒绝服务',
    ),
    UER_EMAIL_CODE_UNSEND:AppNotification(
      situaCode: SituationEnum.ERROR,
      title: '邮箱验证码未发送',
      desc: '邮箱验证码未发送成功',
    ),
  };
  static AppNotification getCorNotification(int resCode){
    return resCodeMap[resCode]??unknownNotification;
  }
  static Set<int>warningSet={
    //client
    CLIENT_LOGIN_EXPIRED,
    USER_CANCELED,
    //server
    USER_PWD_UNSET,
    USER_LOGIN_EXPIRED,
  };
}