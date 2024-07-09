import 'package:chatapp/Pages/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatapp/Model/ChatModel.dart';

class Buttoncard extends StatelessWidget {
  final ChatModel chatmodel;
  const Buttoncard({Key? key , required this.chatmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueGrey,
            child: SvgPicture.asset(
              "assets/person.svg",
              color: Colors.white,
              height:40,
            ),
          ),
          title:Text(
            chatmodel.name,
            style:const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ) ,
          ),
          subtitle:Text(
            chatmodel.currentMessage,
            style: const TextStyle(
                fontSize: 13
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 80,right: 20),
          child:Divider(thickness: 1),
        )
      ],
    );
  }
}
