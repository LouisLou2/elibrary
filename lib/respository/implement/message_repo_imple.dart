import 'package:elibrary/datasource/db/interface/message_db_ds.dart';
import 'package:elibrary/domain/entity/message.dart';
import 'package:elibrary/domain/entity/simple_user.dart';

import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:get_it/get_it.dart';

import '../interface/message_repo.dart';

class MessageRepImple extends MessageRep {
  MessageDbDs messageDbDs= GetIt.I<MessageDbDs>();

  @override
  Future<Result<List<AppMessage>>> getMessages({required int senderId, required int receiverId, required int offset, required int num}) {
    return messageDbDs.getMessages(senderId: senderId, receiverId: receiverId, offset: offset, num: num);
  }

  @override
  Future<Result<bool>> saveMessage(List<AppMessage> message) {
    return messageDbDs.saveMessage(message);
  }

  @override
  Future<Result<List<AppMessage>>> getAllMessages({required int senderId, required int receiverId}) {
    return messageDbDs.getAllMessages(senderId: senderId, receiverId: receiverId);
  }

  @override
  Future<Result<List<AppMessage>>> getLatestMessages({required int myUserId}) {
    return messageDbDs.getLatestMessages(myUserId: myUserId);
  }

  @override
  Future<Result<bool>> deleteMessages({required int oneId, required int otherId}) {
    return messageDbDs.deleteMessages(oneId: oneId, otherId: otherId);
  }
}