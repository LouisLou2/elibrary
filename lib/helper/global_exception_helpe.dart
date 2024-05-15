import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../constant/rescode.dart';
import '../domain/util_model/res_info.dart';

class GlobalExceptionHelper{

  static Result<T> getErrorResInfo<T>(Object e){
    // network part
    if(e.runtimeType==DioException){
      DioException dioE=e as DioException;
      if(dioE.type == DioExceptionType.cancel){
        return Result(ResCode.USER_CANCELED);
      }
      else if(isTimeOutException(e)){
        return Result(ResCode.REQUEST_TIME_OUT);
      }
      else if(dioE.type == DioExceptionType.connectionError){
        return Result(ResCode.CANNOT_CONNECT);
      }
      return Result(ResCode.REQUEST_ERROR);
    }
    // database part
    if(e.runtimeType==IsarError){
      return Result(ResCode.DB_ERROR);
    }
    // debug part
    return Result(ResCode.DEBUG_ERROR);
  }

  // network part: timeout
  static bool isTimeOutException(DioException e){
    return e.type==DioExceptionType.sendTimeout||e.type==DioExceptionType.receiveTimeout||e.type==DioExceptionType.connectionTimeout;
  }
}