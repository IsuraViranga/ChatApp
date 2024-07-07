import 'package:chatapp/customUI/CustomCard.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

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
      body:ListView(
        children: const [
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
        ],
      ),
    );
  }
}
