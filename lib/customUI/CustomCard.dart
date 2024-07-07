import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
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
            title:const Text(
                "Amma",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ) ,
            ),
            subtitle: const Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                    "hello amma",
                     style: TextStyle(
                       fontSize: 13
                     ),
                )
              ],
            ),
            trailing: const Text("18.4"),
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
