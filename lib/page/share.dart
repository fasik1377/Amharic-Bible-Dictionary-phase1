import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SendFeedback extends StatefulWidget {
  const SendFeedback({ Key? key }) : super(key: key);

  @override
  State<SendFeedback> createState() => _SendFeedbackState();
}

class _SendFeedbackState extends State<SendFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Share app"),
        backgroundColor: Colors.brown,
        actions: [
          Padding(padding: EdgeInsets.all(10),
          child: IconButton(
            icon:Icon(Icons.share_outlined),
            onPressed: (){
              Share.share("https://play.google.com/store/apps/details?id=com.example.filter_listview_example");
            }, ),)
        ],
      ),
      
    );
  }
}