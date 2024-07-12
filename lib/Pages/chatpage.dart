import 'package:chatapp/customUI/CustomCard.dart';
import 'package:flutter/material.dart';
import '../Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
   final List<ChatModel> chatmodel;
   final ChatModel sourceChat;
   const ChatPage({Key? key,required this.chatmodel,required this.sourceChat}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.chat),
          backgroundColor:const Color(0xFF035A45),
      ),
      body:ListView.builder(
          itemCount:widget.chatmodel.length,
          itemBuilder:(context,index)=>CustomCard(chatmodel:widget.chatmodel[index],sourceChat:widget.sourceChat)
      )
    );
  }
}
