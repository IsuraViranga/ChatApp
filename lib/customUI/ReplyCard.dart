import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  final String message;
  final String time;
  const ReplyCard({Key? key,required this.message,required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-50,
        ),
        child:Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 50,top: 5,bottom: 22),
                  child: Text(message,style: TextStyle(
                      fontSize: 16
                  ),),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Text(time,style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800]
                  ),),
                )
              ],
            )

        ) ,
      ),
    );
  }
}
