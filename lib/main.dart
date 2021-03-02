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
       MenuText("ANA SAYFA"),
        MenuText("ARAMA SAYFASI"),
         MenuText("MENU SAYFASI"),
     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: _currentIndex, 
       onTap:onTabTapped,
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
           icon: Icon(Icons.home),
           label:"Ana Sayfa"
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.search),
           label:"Ara"
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.menu),
           label:"Menü"
         )
       ],
     ),
    body: _children[_currentIndex]
   );
  }
void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}


class MenuText extends StatelessWidget {
 final String txt;

 MenuText(this.txt);

 @override
 Widget build(BuildContext context) {
   return Container(
     child:
    Center(child: Text(txt)),
   );
 }
}