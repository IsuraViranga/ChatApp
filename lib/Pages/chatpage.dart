import 'package:chatapp/customUI/CustomCard.dart';
import 'package:flutter/material.dart';
import '../Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<ChatModel> chatmodel=[
    ChatModel(name: "vinura", time: "10.00", icon: "person", currentMessage: "hello aiya", isGroup: false),
    ChatModel(name: "rasika", time: "4.00", icon: "person", currentMessage: "hello ", isGroup: false),
    ChatModel(name: "gayani", time: "5.00", icon: "person", currentMessage: "hello ", isGroup: false),
    ChatModel(name: "mama", time: "8.00", icon: "person", currentMessage: "hello ", isGroup: false),
    ChatModel(name: "chamal", time: "7.00", icon: "person", currentMessage: "hello ", isGroup: false),
    ChatModel(name: "chathura", time: "10.00", icon: "person", currentMessage: "hello ", isGroup: false),
    ChatModel(name: "UOM", time: "10.00", icon: "group", currentMessage: "hello ", isGroup: true),
    ChatModel(name: "FIT", time: "6.00", icon: "group", currentMessage: "hello ", isGroup: true),
    ChatModel(name: "Dev stack", time: "10.00", icon: "group", currentMessage: "hello", isGroup: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.chat),
          backgroundColor:const Color(0xFF035A45),
      ),
      body:ListView.builder(
          itemCount:chatmodel.length,
          itemBuilder:(context,index)=>CustomCard(chatmodel:chatmodel[index])
      )
    );
  }
}
