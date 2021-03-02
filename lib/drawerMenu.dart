import 'package:diyet/listPage.dart';
import 'package:flutter/material.dart';

class CustomDrawerMenu extends StatefulWidget {
  @override
  _CustomDrawerMenuState createState() => _CustomDrawerMenuState();
}

class _CustomDrawerMenuState extends State<CustomDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('ANA SAYFA'),
            trailing: Icon(Icons.arrow_back),
            onTap: () {
              //YÖNLENDİRME YAPMAK İSTİYORSAK YÖNT-1
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ListPage()));

              //YÖNLENDİRME YAPMAK İSTİYORSAK YÖNT-2
              //Navigator.pushNamed(context, routeName);

              //Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
