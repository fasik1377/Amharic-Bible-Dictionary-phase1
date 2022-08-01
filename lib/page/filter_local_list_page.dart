import 'package:filter_listview_example/data/book_data.dart';
import 'package:filter_listview_example/drawer.dart';
import 'package:filter_listview_example/main.dart';
import 'package:filter_listview_example/model/book.dart';
//import 'package:filter_listview_example/notes/screens/note_screen.dart';
import 'package:filter_listview_example/page/contacts.dart';
import 'package:filter_listview_example/page/events.dart';
import 'package:filter_listview_example/page/notes.dart';
import 'package:filter_listview_example/page/notifications.dart';
import 'package:filter_listview_example/page/privacy_policy.dart';
import 'package:filter_listview_example/page/share.dart';
import 'package:filter_listview_example/page/settings.dart';
import 'package:filter_listview_example/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  var currentPage = DrawerSections.dashboard;
  late List<Book> books;
  String query = '';

  @override
  void initState() {
    super.initState();

    books = allBooks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(MyApp.title,
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
              background: Image.asset(
                "assets/bible-wallpaper.jpg",
                fit: BoxFit.cover,
              ),
            ),
            floating: true,
            snap: true,
            actions: [
            ],
          ),
        ],
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              MyHeaderDrawer(),
              MyDrawerList(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 3,
        children: [
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text("መዝገበ ቃላት"),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => FilterLocalListPage(),
            )),
          ),
          Divider(),
          ListTile(
              leading: const Icon(Icons.people_alt_outlined),
              title: const Text("ያግኙ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Contacts(),
                ));
              }
              ),
              Divider(),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text("ሁነቶች"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Events(),
                ));
              }
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text("ማስታወሻ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  Notes(),
                ));
              }
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("ማስተካከያ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Settings(),
                ));
              }
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text("ማንቂያ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ));
              }
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("የግላዊነት ፖሊሲ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PrivacyPolicy(),
                ));
              }
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text("መተግበሪያውን አጋራ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SendFeedback(),
                ));
              }
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'search',
        onChanged: searchBook,
      );

  Widget buildBook(Book book) => Card(
        elevation: 3,
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
            book.title,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            book.author,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

  void searchBook(String query) {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
