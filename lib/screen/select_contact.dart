import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gbwhatsapp/CustomUI/contact_card.dart';
import 'package:gbwhatsapp/chat_model.dart';
import 'package:gbwhatsapp/screen/buttoncard.dart';
import 'package:gbwhatsapp/screen/create_group.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text("Select Contact",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                ),),
              Text("200 contacts",
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
            PopupMenuButton<String>(
                onSelected: (value){
                  print(value);
                },
                itemBuilder: (BuildContext context){
                  return [
                    PopupMenuItem(
                        child: Text("Invite a friend"),
                        value:"Invite a friend"
                    ),
                    PopupMenuItem(
                        child: Text("Contacts"),
                        value:"Contacts"
                    ),
                    PopupMenuItem(
                        child: Text("Refresh"),
                        value:"Refresh"
                    ),
                    PopupMenuItem(
                        child: Text("Help"),
                        value:"Help"
                    ),


                  ];
                }
            )
          ],
        ),

        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: contacts.length+3,
                  itemBuilder: (context,index) {
                      if(index==0){
                        return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateGroup()));
                            },
                            child: ButtonCard(icon: Icons.group,name: "New group",));
                      }
                      if(index==1){
                        return ButtonCard(icon: Icons.person_add,name: "New contact",icons: Icons.widgets_outlined,);
                       }
                      if(index==2){
                        return ButtonCard(name: "New community", icon: Icons.people);
                      }
                      if(index==3){
                        return Padding(
                          padding: const EdgeInsets.only(left: 21,bottom: 10,top: 12),
                          child: Text("Contacts on Whatsapp"),
                        );
                      }
                        return ContactCard(contact: contacts[index-3]);
                      }
              ),
            ),
          ]

        )
    );
  }
}
