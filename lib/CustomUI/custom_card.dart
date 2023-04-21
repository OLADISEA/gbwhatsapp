import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gbwhatsapp/chat_model.dart';
import 'package:gbwhatsapp/screen/individual_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage(chatModel: chatModel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 30,
              child: SvgPicture.asset(
                "assets/${chatModel.icon}",color: Colors.white,width: 37,height: 37,),
            ),
            title: Text(chatModel.name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
            subtitle: Row(
              children: [
                Icon(Icons.done,size: 15,),
                SizedBox(width: 3,),
                Text(chatModel.currentMessage,
                  style: TextStyle(
                    fontSize: 13,
                  ),),
              ],
            ),
            trailing: Text("2:05am"),
          ),
          Padding(
            padding: const EdgeInsets.only(right:20,left:80.0),
            child: Divider(
              thickness: 1,),
          )
        ],
      ),
    );
  }
}
