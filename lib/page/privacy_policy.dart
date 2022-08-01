import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({ Key? key }) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Privacy Policy", ),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top:100)),
            Image.asset(
                "assets/bible-wallpaper.jpg",
                height: 100,
                width: 100,
              ),
            Text("የመጽሐፍ ቅዱስ መዝገበ ቃላት",style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20),),
            Text("Amharic Bible Dictionary", style: TextStyle(fontSize: 20),),
            Text("version: v.1 2022", style: TextStyle(fontSize: 16),),
            Text("DEVELOPED BY", style: TextStyle(fontSize: 16),),
            Text("Fasika Abera", style: TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }
}