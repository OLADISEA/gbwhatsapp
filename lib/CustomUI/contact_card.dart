import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gbwhatsapp/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key,required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          height: 53,
          width: 50,
          child: Stack(
            children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset("assets/person.svg",
                height: 30,
                width: 30,
                color: Colors.white,),
              radius: 23,
            ),
              contact.select?Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 11,
                  child: Icon(Icons.check,
                  color: Colors.white,
                  size: 18,),

                ),
              ):Container()
    ]
          ),
        ),
        title: Text(
           contact.name,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),),
        subtitle: Text(contact.status,
          style: TextStyle(
              fontSize: 13
          ),),

      );
  }
}
