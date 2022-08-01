import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filter_listview_example/page/theme/theme_constants.dart';
import 'package:filter_listview_example/page/theme/theme_manager.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}
ThemeManager _themeManager = ThemeManager();

class _SettingsState extends State<Settings> {
  @override
  void dispose(){
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState(){
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("Settings", style: TextStyle(fontSize: 22),
        ),
        actions: [Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged:(newValue){
          _themeManager.toggleTheme(newValue);
        })],
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
            )
      );
      
  }
}