import 'package:filter_listview_example/page/filter_local_list_page.dart';
import 'package:filter_listview_example/page/filter_network_list_page.dart';
import 'package:filter_listview_example/page/theme/theme_constants.dart';
import 'package:filter_listview_example/page/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}
ThemeManager _themeManager = ThemeManager();
class MyApp extends StatelessWidget {
  static final String title = 'የመጽሐፍ ቅዱስ መዝገበ ቃላት';
  
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
       // bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  /*Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('Filter List', style: style),
          title: Text('Local'),
        ),
        BottomNavigationBarItem(
          icon: Text('Filter List', style: style),
          title: Text('Network'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }*/

  Widget buildPages() {
    switch (index) {
      case 0:
        return FilterLocalListPage();
      case 1:
        return FilterNetworkListPage();
      default:
        return Container();
    }
  }
}
