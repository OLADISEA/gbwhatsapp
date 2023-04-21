import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gbwhatsapp/CustomUI/contact_card.dart';
import 'package:gbwhatsapp/chat_model.dart';


class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Oladisea", status: "A flutter ninja"),
    ChatModel(name: "Mana Design", status: "Busy..."),
    ChatModel(name: "Sir kazy", status: "Steady on my grind"),
    ChatModel(name: "Hustle Danie", status: "Crypto Expert"),
    ChatModel(name: "Bismaster", status: "Available for transactions"),
    ChatModel(name: "Eminence", status: "Instrument lover"),
    ChatModel(name: "Mopol", status: "Money man"),
    ChatModel(name: "Tomzeyhey", status: "Manchester united fan"),
    ChatModel(name: "Lanre", status: "Full stack developer"),



  ];

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text("New Group",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                ),),
              Text("Add participants",
                style: TextStyle(
                    fontSize: 13
                ),)
            ],
          ),

          actions: [
            IconButton(
                icon: Icon(Icons.search,
                    size:26),
                onPressed: (){}
            ),

          ],
        ),

        body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context,index) {
                      return InkWell(
                          onTap: (){
                            if(contacts[index].select == false){
                              setState(() {
                                contacts[index].select = true;
                                groups.add(contacts[index]);
                                print(contacts[index].name);

                              });
                            }else{
                              setState(() {
                                contacts[index].select = false;
                                groups.remove(contacts[index]);
                                print(groups[index].name);
                              });

                            }
                          },
                          child: ContactCard(contact: contacts[index]));
                    }
                ),
              ),
            ]

        )
    );
  }
}

