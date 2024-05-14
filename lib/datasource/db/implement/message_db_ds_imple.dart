import 'package:elibrary/domain/entity/message.dart';
import 'package:isar/isar.dart';

import '../../../domain/util_model/res_info.dart';
import '../../../helper/global_exception_helpe.dart';
import '../interface/message_db_ds.dart';
import '../manage/db_manager.dart';

class MessageDbDsImple implements MessageDbDs {
  Isar get db => DBManager.db;

  @override
  Future<Result<List<AppMessage>>> getMessages({
    required int senderId,
    required int receiverId,
    required int offset,
    required int num,
  }) async{
    try{
      List<AppMessage> messages=await db.appMessages.
      where()
          .senderIdReceiverIdEqualToAnyTime(senderId,receiverId)
          .sortByTimeDesc()
          .offset(offset)
          .limit(num)
          .findAll();
      return Result.success(messages);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo<List<AppMessage>>(e);
    }
  }
  @override
  Future<Result<bool>> saveMessage(List<AppMessage> message){
    return db.writeTxn(() async {
      try{
        db.appMessages.putAll(message);
        return Result.success(true);
      } catch(e){
        return GlobalExceptionHelper.getErrorResInfo<bool>(e);
      }
    });
  }

  @override
  Future<Result<List<AppMessage>>> getAllMessages({required int senderId, required int receiverId}) {
    return db.appMessages
        .where()
        .senderIdReceiverIdEqualToAnyTime(senderId,receiverId)
        .or()
        .senderIdReceiverIdEqualToAnyTime(receiverId,senderId)
        .sortByTimeDesc()
        .findAll()
        .then((value) => Result.success(value))
        .catchError((e) => GlobalExceptionHelper.getErrorResInfo<List<AppMessage>>(e));
  }

  @override
  Future<Result<List<AppMessage>>> getLatestMessages({required int myUserId}) async{
    try{
      // 获取所有 senderId 为 1 的消息
      List<AppMessage> messages = await db.appMessages
          .filter()
          .senderIdEqualTo(myUserId)
          .or()
          .receiverIdEqualTo(myUserId)
          .sortByTimeDesc()
          .findAll();

      Map<int,AppMessage> candidateMessages={};
      List<AppMessage> resMessages=[];

      for(AppMessage message in messages){
        int otherId=(message.senderId==myUserId) ? message.receiverId : message.senderId;
        if(candidateMessages.containsKey(otherId)){
          if(message.time.isAfter(candidateMessages[otherId]!.time)){
            candidateMessages[otherId]=message;
          }
        }else{
          candidateMessages[otherId]=message;
        }
      }
      resMessages=candidateMessages.values.toList();
      return Result.success(resMessages);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo<List<AppMessage>>(e);
    }
  }

  @override
  Future<Result<bool>> deleteMessages({required int oneId, required int otherId}) {
    return db.writeTxn(() async {
      try{
        db.appMessages
            .where()
            .senderIdReceiverIdEqualToAnyTime(oneId,otherId)
            .or()
            .senderIdReceiverIdEqualToAnyTime(otherId,oneId)
            .deleteAll();
        return Result.success(true);
      } catch(e){
        return GlobalExceptionHelper.getErrorResInfo<bool>(e);
      }
    });
  }
}