import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width-45
          ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          color: Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10,right: 73 ,bottom: 20,top:5 ),
                child: Text("Welcome to Whatsapp",
                style: TextStyle(
                  fontSize: 16
                ),),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text("20:56am",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.done_all,
                    size: 20,)
                  ],
                ),
              )
            ],
          ),
      ),),
    );
  }
}
