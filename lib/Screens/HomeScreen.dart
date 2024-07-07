import 'package:flutter/material.dart';

import '../Pages/chatpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          IconButton(onPressed: (){}, icon:const Icon(Icons.search)),
          PopupMenuButton(
              onSelected:(value){
                print(value);
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
                  value:"ChatMe web",
                  child: Text("ChatMe web"),
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
        children: const [
          Text("camera"),
          chatPage(),
          Text("status"),
          Text("calls")
        ],
      ),
    );
  }
}
