import 'package:flutter/material.dart';
import '01_Pages/013_Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ビルドした時に「Home画面」に遷移
      // いずれは「Login画面」に遷移するように変更する。
      home: HomePage(),
    );
  }
}
