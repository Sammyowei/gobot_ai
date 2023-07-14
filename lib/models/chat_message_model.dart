import 'models.dart';

class GobotChatMessage {
  GobotChatMessage({
    required this.chatType,
    required this.chatUser,
    required this.createdAt,
     this.message,
    this.updatedAt,
  });
  final GChatUser chatUser;
  final GChatType chatType;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? message;
}

enum GChatType { textMesage, audioMessage }
