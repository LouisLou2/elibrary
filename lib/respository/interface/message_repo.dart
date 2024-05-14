import 'package:elibrary/domain/entity/message.dart';
import 'package:elibrary/domain/entity/simple_user.dart';

import '../../domain/util_model/res_info.dart';

abstract class MessageRep {
  Future<Result<List<AppMessage>>> getMessages({required int senderId, required int receiverId, required int offset, required int num});
  Future<Result<List<AppMessage>>> getAllMessages({required int senderId, required int receiverId});
  Future<Result<List<AppMessage>>> getLatestMessages({required int myUserId});
  Future<Result<bool>> saveMessage(List<AppMessage> message);
  Future<Result<bool>> deleteMessages({required int oneId,required int otherId});
}