import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gbwhatsapp/screen/camera_screen.dart';
import 'package:gbwhatsapp/screen/home_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "OpenSans",
            primaryColor: Color(0XFF075E54),
            accentColor: Color(0xFF12867E)
        ),
        home: Home()
    );
  }
}

