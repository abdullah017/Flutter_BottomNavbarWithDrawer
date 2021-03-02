import 'package:diyet/listPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    MenuText("PROFİLİM SAYFASI"),
    MenuText("MESAJLARIM SAYFASI"),
    ListPage(),
    MenuText("ARAMA SAYFASI"),
    MenuText("MENU SAYFASI"),
  ];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTabTapped,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: "Profilim",
                  icon: new Icon(Icons.account_circle_rounded),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.mail),
                  label: "Messagess",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Ana Sayfa"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "Ara"),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menü")
              ],
            ),
          ),
        ),
        body: _children[_currentIndex]);
  }

  void onTabTapped(int index) {
    setState(() {
      index == 4 ? _drawerKey.currentState.openDrawer() : _currentIndex = index;
    });
  }
}

class MenuText extends StatelessWidget {
  final String txt;
  MenuText(this.txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(txt)),
    );
  }
}
