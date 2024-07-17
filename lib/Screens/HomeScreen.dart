import 'package:flutter/material.dart';
import '../Model/ChatModel.dart';
import '../Pages/chatpage.dart';
import 'package:chatapp/Screens/SerachPage.dart';
import 'package:chatapp/Screens/AddFriend.dart';

class HomeScreen extends StatefulWidget {
  final ChatModel sourceChat;

  const HomeScreen({Key? key,required this.sourceChat}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller=TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("ChatMe"),
        backgroundColor:const Color(0xFF035A45),
        actions: [
          IconButton(
              onPressed: (){
                 setState(() {
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => searchPage(
                           sourceChat:widget.sourceChat
                       ))
                   );
                 });
              }, 
              icon:const Icon(Icons.search)
          ),
          PopupMenuButton(
              onSelected:(value){
                if(value=="Add Contact"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFriend(
                      sourceChat:widget.sourceChat
                  )));
                }
              } ,
              itemBuilder: (BuildContext context){
            return const[
              PopupMenuItem(
                  value:"New group",
                  child: Text("New group"),
              ),
              PopupMenuItem(
                  value:"New broadcast",
                  child: Text("New broadcast"),
              ),
              PopupMenuItem(
                  value:"Add Contact",
                  child: Text("Add Contact"),
              ),
              PopupMenuItem(
                  value:"Starred messages",
                  child: Text("Starred messages"),
              ),
              PopupMenuItem(
                  value:"Settings",
                  child: Text("Settings"),
              )
            ];
          }),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text:"CHATS",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body:TabBarView(
        controller: _controller,
        children:[
          Text("camera"),
          ChatPage(
              sourceChat:widget.sourceChat
          ),
          Text("status"),
          Text("calls")
        ],
      ),
    );
  }
}
