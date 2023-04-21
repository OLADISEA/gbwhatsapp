import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gbwhatsapp/screen/camera_view.dart';
import 'package:gbwhatsapp/screen/video_view.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



late List<CameraDescription> cameras;
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool isRecording = false;
  Future<void>? cameraValue;
  bool flash = false;
  bool takeSelfie = false;
  double transform =0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(_cameraController));

                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {
                        flash? _cameraController.setFlashMode(FlashMode.torch):
                        _cameraController.setFlashMode(FlashMode.off);
                        setState((){
                          flash = !flash;
                        });
                      },
                        icon: flash?Icon(Icons.flash_on):Icon(Icons.flash_off,
                          size: 26,
                          color: Colors.white,
                        ),

                      ),
                      GestureDetector(
                        onTap: () {
                          if(!isRecording) {
                            takePhoto(context);
                          }
                        },
                        onLongPress: () async {
                          await _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;

                          });
                        },
                        onLongPressUp: () async {
                          final XFile videoPath=await _cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (builder) =>
                              VideoViewPage(path: videoPath.path)));
                        },
                        child: isRecording?Icon(Icons.radio_button_checked,size: 80,color: Colors.red,)
                            :Icon(Icons.panorama_fish_eye,
                          size: 70,
                          color: Colors.white,
                        ),

                      ),
                      IconButton(onPressed: () async{
                        setState(() {
                          takeSelfie = !takeSelfie;
                          transform = transform + pi;
                        });
                        int camerapos = takeSelfie?1:0;
                        _cameraController = CameraController(cameras[camerapos], ResolutionPreset.high);
                        cameraValue = _cameraController.initialize();
                      },
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(Icons.flip_camera_ios,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),

                      )
                    ],
                  ),
                  SizedBox(height: 4,),
                  Text("Hold for video, tap for photo",
                    style: TextStyle(
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

    void takePhoto(BuildContext context) async{
      XFile images = await _cameraController.takePicture();
      Navigator.push(context, MaterialPageRoute(builder: (builder) => CameraView(path:images.path)));
    }

}
