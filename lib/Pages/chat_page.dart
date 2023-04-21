import 'package:flutter/material.dart';
import 'package:gbwhatsapp/CustomUI/custom_card.dart';
import 'package:gbwhatsapp/chat_model.dart';
import 'package:gbwhatsapp/screen/select_contact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(name: "Oladisea", icon: "person.svg", isGroup: false, time: "9:34",
        currentMessage: "This is just a Demo"),
    ChatModel(name: "Sir Kazy", icon: "person.svg", isGroup: false, time: "9:36",
        currentMessage: "You saw that coming"),
    ChatModel(name: "Eze Gold", icon: "person.svg", isGroup: false, time: "10:34",
        currentMessage: "I have decided to play the card"),
    ChatModel(name: "BrainStorming", icon: "groups.svg", isGroup: true, time: "9:56",
        currentMessage: "Brainstorming will start soon"),
    ChatModel(name: "Crypto Earners", icon: "groups.svg", isGroup: true, time: "3:34",
        currentMessage: "Legit signal incoming")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(
              chatModel:chats[index]
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder) => SelectContact() ));
        },
        child: Icon(Icons.chat),
      ),

    );


  }
}
