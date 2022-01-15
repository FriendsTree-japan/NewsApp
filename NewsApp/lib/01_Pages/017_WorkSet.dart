import 'package:flutter/material.dart';

class WorkSet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Column(
          children: [
            Container(
              child: Text('キーワードを設定する'),
            ),
            Container(
              child: Text('〜キーワードを押下したら下にずらっとなっていく〜'),
            ),
            Container(
              padding: EdgeInsets.all(100),
            ),
            Container(
              child: Text('配信時刻を設定する'),
            ),
          ],
        ),
    );
  }
}