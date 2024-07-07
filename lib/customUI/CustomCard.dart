import 'package:chatapp/Screens/individualPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Model/ChatModel.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatmodel;
  const CustomCard({Key? key , required this.chatmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage()));
      },
      child: Column(
        children: [
          ListTile(
            leading:CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                  chatmodel.isGroup? "assets/groups.svg" :"assets/person.svg",
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
            subtitle:Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                     chatmodel.currentMessage,
                     style: const TextStyle(
                       fontSize: 13
                     ),
                )
              ],
            ),
            trailing:Text(chatmodel.time),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 80,right: 20),
            child:Divider(thickness: 1),
          )
        ],
      ),
    );
  }
}
