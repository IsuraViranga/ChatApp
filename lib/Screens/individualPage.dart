import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatmodel;
  const IndividualPage({Key? key ,required this.chatmodel}) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 70,
          backgroundColor:const Color(0xFF035A45),
          leading:InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 20,
                  child:SvgPicture.asset(
                      widget.chatmodel.isGroup?"assets/groups.svg":"assets/person.svg",
                      color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          title:InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.all(7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    widget.chatmodel.name,
                    style: const TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text(
                    "last seen today at 12.05",
                    style:TextStyle(
                      fontSize: 15
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.videocam)),
            IconButton(onPressed: (){}, icon:Icon(Icons.call)),
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
        ),
    );
  }
}
