import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewPage extends StatefulWidget {
  VideoViewPage({Key? key,required this.path}) : super(key: key);
  String path;

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> videoFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoPlayerController = VideoPlayerController.file(File(widget.path))
      ..initialize().then((value) => null);
    videoFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    setState(() {

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }
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
              child: _videoPlayerController.value.isInitialized?
              AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),):Container()

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
                )),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  setState(() {
                    _videoPlayerController.value.isPlaying? _videoPlayerController.pause(): _videoPlayerController.play();
                  });
                },
                child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.black38,
                    child: Icon(_videoPlayerController.value.isPlaying?Icons.pause:Icons.play_arrow,color: Colors.white,)),
              ),
            )
          ],
        ),
      ),

    );
  }
}
