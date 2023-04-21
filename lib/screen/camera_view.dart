import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  CameraView({Key? key,required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.crop_rotate)),
          IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.title)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit))


        ],
      ),
      body: Container(
        //color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -150,
                child: Image.file(File(path),
                fit: BoxFit.cover,),

            ),
            Align(
              heightFactor: 9.9,
              alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                  //color: Colors.black26,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(40)
                  ),
                  //height: 64,
                  width: MediaQuery.of(context).size.width-17,
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add a caption...",
                      prefixIcon: Icon(Icons.add_photo_alternate_rounded,color: Colors.white,size: 27,),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.tealAccent[700],
                        child: Icon(Icons.check,color: Colors.white,size: 27,),
                      )
                    ),

                  ),
                ))
          ],
        ),
      ),

    );
  }
}
