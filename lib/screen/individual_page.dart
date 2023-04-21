import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gbwhatsapp/CustomUI/reply_card.dart';
import 'package:gbwhatsapp/CustomUI/user_message_card.dart';
import 'package:gbwhatsapp/chat_model.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;


  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool emojiShowing = false;
  FocusNode focus = FocusNode();
  bool showAttachment = false;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focus.addListener(() {
      if(focus.hasFocus){
        emojiShowing = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/whatsapp.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,),

       Scaffold(
         backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.teal[600],
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,

                  ),
                  CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup? "assets/groups.svg":"assets/person.svg",
                      color: Colors.white,
                      height: 36,
                      width: 36,
                    ),
                    //"assets/${widget.chatModel.icon}",color: Colors.white,width: 37,height: 37,),
                    radius: 20 ,
                    backgroundColor: Colors.blueGrey,

                  )
                ],
              ),
            ),
            title: InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.chatModel.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.5
                      ),),
                    Text("last seen today at 12:02am",
                      style: TextStyle(
                          fontSize: 13
                      ),)
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.videocam)),
              IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
              PopupMenuButton<String>(
                  padding: EdgeInsets.all(0),
                  onSelected: (value){
                    print(value);
                  },
                  itemBuilder: ((BuildContext context) {
                    return [
                      PopupMenuItem(
                          child: Text("View contact"),
                          value:"View contact"
                      ),
                      PopupMenuItem(
                          child: Text("Media, links, and docs"),
                          value:"Media, links, and docs"
                      ),
                      PopupMenuItem(
                          child: Text("Search"),
                          value:"Search"
                      ),
                      PopupMenuItem(
                          child: Text("Mute notifications"),
                          value:"Mute notifications"
                      ),
                      PopupMenuItem(
                          child: Text("Disappearing messages"),
                          value:"Disappearing messages"
                      ),

                      PopupMenuItem(
                          child: Text("Wallpaper"),
                          value:"Wallpaper"
                      ),
                    ];
                  }))
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 140,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                        UserMessage(),
                        ReplyMessage(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width-55,
                              child: Card(
                                  margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focus,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a message",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: IconButton(
                                          icon: const Icon(Icons.emoji_emotions_outlined),
                                          onPressed: (){
                                            setState(() {
                                              focus.unfocus();//The unfocus removes the focus from the text form field(keyboard)
                                              focus.canRequestFocus = false; //provided that the keyboard is active
                                              emojiShowing = !emojiShowing;
                                            });
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.attach_file),
                                              onPressed: (){
                                                showModalBottomSheet(
                                                    backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (builder) => menuAttach()
                                                );
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.camera_alt),
                                              onPressed: (){},
                                            ),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(5)
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, right: 2,left: 2),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xFF128C7E),
                                child: IconButton(
                                  icon: Icon(Icons.mic,
                                    color: Colors.white,),
                                  onPressed: (){},
                                ),
                              ),
                            )
                          ],
                        ),
                        emojiShowing?selectEmoji():Container()
                      ],
                    ),
                  )
                ],
              ),
              onWillPop: (){
                if(emojiShowing){
                  setState(() {
                    emojiShowing = false;
                  });
                }else{
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          )
      ),
    ]);}
  Widget menuAttach(){
    return Container(
      height: MediaQuery.of(context).size.height - ((MediaQuery.of(context).size.height*0.005)*100),
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          // padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  menuContent(Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40 ,
                  ),
                  menuContent(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40 ,
                  ),
                  menuContent(Icons.insert_photo, Colors.purple, "Gallery")
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  menuContent(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(width: 40,),
                  menuContent(Icons.location_on, Colors.teal, "Location"),
                  SizedBox(width: 40,),
                  menuContent(Icons.person, Colors.blue, "Contact")
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  menuContent(Icons.poll, Colors.green, "Poll")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuContent(IconData icon,Color color,String text){
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon,
              size: 29,
              color: Colors.white,),

          ),
          SizedBox(
            height: 5,
          ),
          Text(text,
            style: TextStyle(
                fontSize: 12
            ),)
        ],
      ),
    );
  }
  Widget selectEmoji(){
    return SizedBox(
      height: 230,//number of rows to be displayed
      child: EmojiPicker(
        config: Config(
          columns: 8,// number of column of the emojis displayed
        ),
        textEditingController: _controller,// This controller will add the emoji selected to the text form field

      ),
    );

  }
}
