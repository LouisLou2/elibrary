// 即result info的缩写，用于返回处理结果的信息，包括返回码和数据， 如果返回码是异常的，数据自然为null
import '../../constant/rescode.dart';

class Result<T>{
  int resCode;
  T? data;
  Result(this.resCode, {this.data});
  Result.abnormal(this.resCode):data=null;
  Result.success(this.data):resCode=ResCode.SUCCESS;
}