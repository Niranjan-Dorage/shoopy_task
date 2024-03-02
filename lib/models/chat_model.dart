class Chat {
  String chatId;
  String userId;
  String name;
  String profileImageUrl;
  String lastMessage;
  String lastMessageTimestamp;
  List<Message> messages;

  Chat({
    required this.chatId,
    required this.userId,
    required this.name,
    required this.profileImageUrl,
    required this.lastMessage,
    required this.lastMessageTimestamp,
    required this.messages,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatId: json['chatId'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      lastMessage: json['lastMessage'] as String,
      lastMessageTimestamp: json['lastMessageTimestamp'] as String,
      messages: (json['messages'] as List?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}

class Message {
  String messageId;
  String senderId;
  String message;
  String timestamp;
  bool seen;

  Message({
    required this.messageId,
    required this.senderId,
    required this.message,
    required this.timestamp,
    required this.seen,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageId'] as String,
      senderId: json['senderId'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
      seen: json['seen'] as bool,
    );
  }
}
