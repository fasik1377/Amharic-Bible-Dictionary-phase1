import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({ Key? key }) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.brown,
      width:double.infinity,
      height:200,
      padding:EdgeInsets.fromLTRB(0, 50, 200, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:DecorationImage(
                image:AssetImage("assets/bible-wallpaper.jpg"),
                ),
            ),
          ),
          
        ],
        ),
    );
  }
}