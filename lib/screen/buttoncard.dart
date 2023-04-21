import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key,required this.name,required this.icon,
    this.icons =Icons.abc}) : super(key: key);
  final String name;
  final IconData icon;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF25D366),
          child: Icon(icon,
          size: 26,
          color: Colors.white,),
          radius: 23,

        ),
        title: Text(
          name,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),),
        trailing: name=="New contact"?Icon(icons,color: Colors.white60,): Text(""),



    );
  }
}
