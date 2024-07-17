import 'package:flutter/material.dart';
import '../Model/ChatModel.dart';
import 'package:chatapp/Screens/HomeScreen.dart';
import 'package:chatapp/sqliteDatabase/databaseHelper.dart';
import '../customUI/CustomCard.dart';

class searchPage extends StatefulWidget {
  final ChatModel sourceChat;
  const searchPage({Key? key,required this.sourceChat}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController _textController =TextEditingController();
  bool isContain =false;
  List<ChatModel> filteredChats=[];
  final dbHelper =DatabaseHelper();
  late List<ChatModel> chatmodels=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFriendList();
  }

  void _getFriendList() async {
    final friends = await dbHelper.getFriends();  // Get friends list from database
    setState(() {
      chatmodels=friends;
      filteredChats=friends;
    });
  }

  void _filterChats(String enteredname){
    List<ChatModel> tempChatModels=[];
    if(enteredname.isEmpty){
      tempChatModels=chatmodels;
    }
    else{
        tempChatModels=chatmodels.where((chat){
            return chat.name.toLowerCase().contains(enteredname.toLowerCase());
        }).toList();
    }
    setState(() {
      filteredChats=tempChatModels;
      isContain=enteredname.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Card(
              color:const Color(0xFDF9F9E6),
              margin: EdgeInsets.only(left: 5,top: 30,right: 5),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
              child: TextFormField(
                controller: _textController,
                onChanged: (value){
                  _filterChats(value);
                },
                decoration:InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText:"Search...",
                  prefixIcon: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,color: Colors.black,)
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _textController.clear();
                        _filterChats("");
                      });
                    },
                    icon: isContain ? Icon(Icons.close) :Container(),
                  )
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:filteredChats.length,
                itemBuilder: (context,index)=> CustomCard(chatmodel:filteredChats[index],sourceChat:widget.sourceChat),
              ),
            )
          ],
        ),
      ),
    );
  }
}
