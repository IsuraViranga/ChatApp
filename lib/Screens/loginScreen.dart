import 'package:chatapp/customUI/ButtonCard.dart';
import 'package:flutter/material.dart';
import '../Model/ChatModel.dart';
import 'package:chatapp/Screens/HomeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late ChatModel sourceChat;
  late List<ChatModel> chatmodels=[
    ChatModel(name: "vinura", time: "10.00", icon: "person", currentMessage: "hello aiya", isGroup: false,id: 1),
    ChatModel(name: "rasika", time: "4.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 2),
    ChatModel(name: "gayani", time: "5.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 3),
    ChatModel(name: "mama", time: "8.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 4),
    ChatModel(name: "chamal", time: "7.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 5),
    ChatModel(name: "chathura", time: "11.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 6),
    ChatModel(name: "Punchi", time: "12.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 7),
    ChatModel(name: "LokuAmma", time: "13.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 8),
    ChatModel(name: "Venumi", time: "14.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 9),
    ChatModel(name: "Temp", time: "14.00", icon: "person", currentMessage: "hello ", isGroup: false,id: 0777997689),
    // ChatModel(name: "UOM", time: "10.00", icon: "group", currentMessage: "hello ", isGroup: true),
   // ChatModel(name: "FIT", time: "6.00", icon: "group", currentMessage: "hello ", isGroup: true),
   // ChatModel(name: "Dev stack", time: "10.00", icon: "group", currentMessage: "hello", isGroup: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView.builder(
            itemCount:chatmodels.length,
            itemBuilder:(context,index)=>InkWell(
              onTap: (){
                sourceChat=chatmodels.removeAt(index);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomeScreen(
                    chatmodels:chatmodels,
                    sourceChat:sourceChat
                )));
              },
                child: Buttoncard(chatmodel:chatmodels[index]))
        )
    );
  }
}
