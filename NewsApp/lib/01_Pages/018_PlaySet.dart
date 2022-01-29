import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:NewsApp/01_Pages/013_Home.dart';


class PlaySet extends StatefulWidget {
  @override
  _PlaySetState createState() => _PlaySetState();
}

class _PlaySetState extends State<PlaySet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('コレクション＋ドキュメント作成'),
              onPressed: () async {
                // ドキュメント作成
                await FirebaseFirestore.instance
                    .collection('dogs') // コレクションID
                    .doc('hati') // ドキュメントID
                    .set({'name': '鈴木', 'votes': 40}); // データ
              },
            ),
          ],
        ),
      ),
    );
  }
}