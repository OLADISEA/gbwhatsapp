import 'package:flutter/material.dart';

class ReplyMessage extends StatelessWidget {
  const ReplyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width-45
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          //color: Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10,right: 60 ,bottom: 20,top:5 ),
                child: Text("Thank you. Nice to meet you.",
                  style: TextStyle(
                      fontSize: 16
                  ),),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text("20:56am",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        )),
                ),
            ],
          ),
        ),),
    );
  }
}
