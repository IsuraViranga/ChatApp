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
        body:Container(
          color: Colors.grey,
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment:Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                        width:MediaQuery.of(context).size.width -60,
                        child: Card(
                          margin: EdgeInsets.only(left: 4,right: 2,bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(5),
                                hintText: "Type a message",
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.emoji_emotions,color: Color(0xFF128C7E)),
                                  onPressed: (){},
                                ),
                                suffixIcon:Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(onPressed: (){}, icon:Icon(Icons.attach_file,color: Color(0xFF128C7E),)),
                                    IconButton(onPressed: (){}, icon:Icon(Icons.camera_alt,color: Color(0xFF128C7E))),
                                  ],
                                )
                              ),
                            )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,left: 2,right: 5),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF128C7E),
                        radius: 25,
                        child:IconButton(
                          icon: Icon(Icons.mic,color: Colors.white,),
                          onPressed: (){},
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
