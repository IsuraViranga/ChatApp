class MessageModel {
  final int? id;
  final String senderId;
  final String receiverId;
  final bool read;
  final String message;
  final String type;
  final String time;

  MessageModel({
    this.id,
    required this.senderId,
    required this.receiverId,
    required this.read,
    required this.message,
    required this.type,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'read': read ? 1 : 0,
      'message': message,
      'type': type,
      'time': time,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      read: map['read'] == 1,
      message: map['message'],
      type: map['type'],
      time: map['time'],
    );
  }
}
