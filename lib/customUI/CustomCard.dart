import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading:CircleAvatar(
        radius: 30,
      ),
      title: Text(
          "Amma",
          style:TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ) ,
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text("hello amm")
        ],
      ),
      trailing: Text("18.4"),
    );
  }
}
