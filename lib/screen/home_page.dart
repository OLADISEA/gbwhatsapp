import'package:flutter/material.dart';
import 'package:gbwhatsapp/Pages/camera_page.dart';
import 'package:gbwhatsapp/Pages/chat_page.dart';
import 'package:gbwhatsapp/screen/status_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('WhatsApp clone'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                      child: Text("New group"),
                      value:"New group"
                  ),
                  PopupMenuItem(
                      child: Text("New broadcast"),
                      value:"New broadcast"
                  ),
                  PopupMenuItem(
                      child: Text("Whatsapp Web"),
                      value:"Whatsapp Web"
                  ),
                  PopupMenuItem(
                      child: Text("Starred messages"),
                      value:"Starred messages"
                  ),
                  PopupMenuItem(
                      child: Text("Settings"),
                      value:"Settings"
                  ),

                ];
              }
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text: 'CHATS',),
            Tab(text: 'STATUS',),
            Tab(text: 'CALLS',)
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(),
          StatusPage(),
          Text('CALLS')
        ],
      ),
    );
  }
}
