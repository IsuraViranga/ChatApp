class ChatModel {
  String name;
  String time="2.00";
  String icon="person";
  String currentMessage="hii";
  bool isGroup=false;
  int id;

  ChatModel({
    required this.name,
    required this.id
  });

  Map<String, dynamic> toMap() {
    return {
      'friendID': id,
      'name': name,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['friendID'],
      name: map['name'],
    );
  }
}
