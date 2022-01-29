import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '01_Pages/012_Setting.dart';
import '01_Pages/013_Home.dart';
import '03_FireBase/038_signin.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async{
  _setupTimeZone();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News API Demo',
      home: SignInPage(),
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
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "ホーム"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "お気に入り"),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: "設定"),
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
            Setting(),
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

// タイムゾーンを設定する
Future<void> _setupTimeZone() async {
  tz.initializeTimeZones();
  var tokyo = tz.getLocation('Asia/Tokyo');
  tz.setLocalLocation(tokyo);
}
