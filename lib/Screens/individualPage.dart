import 'package:chatapp/Model/ChatModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../customUI/OwnMessage.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatmodel;
  const IndividualPage({Key? key ,required this.chatmodel}) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show =false;
  FocusNode focusNode =FocusNode();
  TextEditingController _textEditingController =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
       setState(() {
         show=false;
       });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/chatBackground.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
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
            body:WillPopScope(
              child: Container(
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMessage(),
                      ],
                    ),
                    Align(
                      alignment:Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width:MediaQuery.of(context).size.width -60,
                                  child: Card(
                                    margin: EdgeInsets.only(left: 4,right: 2,bottom: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      child: TextFormField(
                                        controller: _textEditingController,
                                        focusNode:focusNode,
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
                                            onPressed: (){
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus=false;
                                              setState(() {
                                                show=!show;
                                              });
                                            },
                                          ),
                                          suffixIcon:Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: (){
                                                    showModalBottomSheet(
                                                        backgroundColor: Colors.transparent,
                                                        context: context,
                                                        builder:(builder)=>bottomSheet()
                                                    );
                                                  },
                                                  icon:Icon(Icons.attach_file,color: Color(0xFF128C7E))
                                              ),
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
                          show?SizedBox(
                              height: 250,
                              child: emojiSelect()
                          ):Container()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onWillPop:(){
                if(show){
                  setState(() {
                    show=false;
                  });
                }
                else{
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
        ),
      ],
    );
  }
  Widget emojiSelect(){
    return EmojiPicker(onEmojiSelected: (category, emoji){
      setState(() {
        _textEditingController.text=_textEditingController.text + emoji.emoji;
      });
    },);
  }

  Widget bottomSheet() {
    return Container(
       height: 300,
       width: MediaQuery.of(context).size.width,
       child: Card(
         shape: RoundedRectangleBorder(
           borderRadius:BorderRadius.circular(25)
         ),
         margin: EdgeInsets.all(18),
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    iconCreation(Icons.insert_drive_file, Colors.blueAccent, "Document"),
                    SizedBox(
                      width: 25,
                    ),
                    iconCreation(Icons.camera_alt, Colors.red, "camera"),
                     SizedBox(
                       width: 25,
                     ),
                    iconCreation(Icons.insert_photo, Colors.purpleAccent, "Gallery"),
                 ],
               ),
               SizedBox(
                 height: 30,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   iconCreation(Icons.headset, Colors.orangeAccent, "Audio"),
                   SizedBox(
                     width: 25,
                   ),
                   iconCreation(Icons.location_pin, Colors.red, "Location"),
                   SizedBox(
                     width: 25,
                   ),
                   iconCreation(Icons.person, Colors.lightBlueAccent, "Contact"),
                 ],
               )
             ],
           ),
         ),
       ),
    );
  }
  Widget iconCreation(IconData icon,Color color,String title){
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor:color,
            child: Icon(icon,color: Colors.white,),
          ),
          SizedBox(
            height: 10,
          ),
          Text(title)
        ],
      ),
    );
  }
}
