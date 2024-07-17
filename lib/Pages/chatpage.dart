import 'package:chatapp/customUI/CustomCard.dart';
import 'package:flutter/material.dart';
import '../Model/ChatModel.dart';
import 'package:chatapp/sqliteDatabase/databaseHelper.dart';

class ChatPage extends StatefulWidget {
   final ChatModel sourceChat;
   const ChatPage({Key? key,required this.sourceChat}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<ChatModel> chatmodel = [];
  final dbHelper =DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFriendList();
  }

  void _getFriendList() async {
    final friends = await dbHelper.getFriends();  // Get friends list from database
    setState(() {
      chatmodel = friends;
    });
  }

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
          itemBuilder:(context,index)=>CustomCard(chatmodel:chatmodel[index],sourceChat:widget.sourceChat)
      )
    );
  }
}
