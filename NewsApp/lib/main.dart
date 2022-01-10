import 'package:flutter/material.dart';
import '01_Pages/013_Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News API Demo',
      home: Newshome(),
    );
  }
}

class Newshome extends StatefulWidget {

  @override
  _NewshomeState createState() => _NewshomeState();
}

class _NewshomeState extends State<Newshome>
    with SingleTickerProviderStateMixin{
  late PageController _pageController;
  int _currentIndex = 0;

  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "Favorite"),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            HomePage(),
            HomePage(),
            HomePage(),
          ]
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeOut);
          });
        },
        items: myBottomNavBarItems(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}
