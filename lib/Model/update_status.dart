import 'package:flutter/material.dart';
import 'package:gbwhatsapp/Model/status_model.dart';

class UpdateStatus extends StatefulWidget {
  UpdateStatus({Key? key,required this.statusModel}) : super(key: key);
  final StatusModel statusModel;

  @override
  _UpdateStatusState createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ,
      )

    );
  }
}
