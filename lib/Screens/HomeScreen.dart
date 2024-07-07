import 'package:flutter/material.dart';

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
          IconButton(onPressed: (){}, icon:const Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
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
          Text("chats"),
          Text("status"),
          Text("calls")
        ],
      ),
    );
  }
}
