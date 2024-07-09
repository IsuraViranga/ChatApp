class ChatModel {
  String name;
  String time;
  String icon;
  String currentMessage;
  bool isGroup;
  int id;

  ChatModel({
    required this.name,
    required this.time,
    required this.icon,
    required this.currentMessage,
    required this.isGroup,
    required this.id
  });
}
