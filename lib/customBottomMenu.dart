import 'package:diyet/drawerMenu.dart';
import 'package:flutter/material.dart';
import 'listPage.dart';

// import 'a_tab_view.dart';
// import 'b_tab_view.dart';
// import 'c_tab_view.dart';

class BnbDemo extends StatefulWidget {
  @override
  _BnbDemoState createState() => _BnbDemoState();
}

class _BnbDemoState extends State<BnbDemo> {
  /// [1] BottomNavigationBar'da yer alacak sayfaların listesi
  final _currentTabPages = <Widget>[
    MenuText("PROFİLİM SAYFASI"),
    MenuText("MESAJLARIM SAYFASI"),
    ListPage(),
    MenuText("ARAMA SAYFASI"),
    CustomDrawerMenu()
  ];

  /// [2] Sayfanın indisini tutuyor.
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildSafeArea(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: _buildBottomNavigationBar(context),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('BNB Demo'),
    );
  }

  SafeArea _buildSafeArea() {
    return SafeArea(
      /// [3] BottomNavigationBar'da [1]'deki sayfalardan gösterilecek olanı
      /// currentIndex değerine göre belirliyoruz
      child: _currentTabPages[_currentIndex],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      /// [4] Geçerli olan indis
      currentIndex: _currentIndex,
      selectedItemColor: Theme.of(context).accentColor,

      /// [5] BNB'de seçilen sekmeye göre ne olacağını ayarlıyoruz
      onTap: _onTap,

      /// [6] Sekmede yerleştirilecek olan sayfaları temsil eden tıklama alanı
      items: _items,
    );
  }

  void _onTap(selectedIndex) {
    /// Seçilen(selectedIndex) ile Görünen (_currentIndex) değer aynı
    /// ise setState çalışmasın
    if (selectedIndex == _currentIndex) {
      return;
    }

    /// selectedIndex değerini [_currentIndex'e atadık]
    setState(() {
      debugPrint('değer: $selectedIndex');
      _currentIndex = selectedIndex;
    });
  }

  List<BottomNavigationBarItem> get _items {
    return <BottomNavigationBarItem>[
      _buildABottomNavigationBarItem(),
      _buildBBottomNavigationBarItem(),
      _buildCBottomNavigationBarItem(),
      _buildDBottomNavigationBarItem(),
      _buildEBottomNavigationBarItem(),
    ];
  }

  BottomNavigationBarItem _buildABottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_rounded), //, color: Colors.grey, size: 30
      label: 'Profilim',
      // activeIcon: Icon(Icons.home),
    );
  }

  BottomNavigationBarItem _buildBBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'Mesajlarım',
      // activeIcon: Icon(Icons.hotel),
    );
  }

  BottomNavigationBarItem _buildCBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Ana Sayfa',
      // activeIcon: Icon(Icons.map),
    );
  }

  BottomNavigationBarItem _buildDBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Arama', //,
      //activeIcon: Icon(Icons.menu),
    );
  }

  BottomNavigationBarItem _buildEBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: 'Menü', //,
      // activeIcon: Icon(Icons.menu),
    );
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
