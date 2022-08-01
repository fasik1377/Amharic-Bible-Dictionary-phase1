import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts ({ Key? key }) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts Page"),
        backgroundColor: Colors.brown,
      ),
      
    );
  }
}