// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class firebaseMethod {
// //チーム情報の更新メソッド
//   void updateTeamInfo({
//     required String Keyword1,
//     required String Keyword2,
//     required String Keyword3,
//     required String Keyword4,
//     required String Keyword5,
//     required String Keyword6,
//     required String Keyword7,
//     required String Keyword8,
//     required String Keyword9,
//     required String Keyword10,
//
//   }) {
//     FirebaseFirestore.instance.collection('Keyword_TBL').doc(documentId).update({
//       'Keyword1': Keyword1,
//       'Keyword2': Keyword2,
//       'Keyword3': Keyword3,
//       'Keyword4': Keyword4,
//       'Keyword5': Keyword5,
//       'Keyword6': Keyword6,
//       'Keyword7': Keyword7,
//       'Keyword8': Keyword8,
//       'Keyword9': Keyword9,
//       'Keyword10': Keyword10,
//     });
//   }
//
// //チーム情報削除メソッド
//   void deleteTeamInfo(String documentId) {
//     FirebaseFirestore.instance.collection('Keyword_TBL').doc(documentId).delete();
//   }
//
// //チーム情報追加メソッド
//   Future<void> createTeamInfo(
//       {
//         required String Keyword1,
//         required String Keyword2,
//         required String Keyword3,
//         required String Keyword4,
//         required String Keyword5,
//         required String Keyword6,
//         required String Keyword7,
//         required String Keyword8,
//         required String Keyword9,
//         required String Keyword10,
//         }) async {
//     await FirebaseFirestore.instance.collection('Keyword_TBL').add({
//       'Keyword1': Keyword1,
//       'Keyword2': Keyword2,
//       'Keyword3': Keyword3,
//       'Keyword4': Keyword4,
//       'Keyword5': Keyword5,
//       'Keyword6': Keyword6,
//       'Keyword7': Keyword7,
//       'Keyword8': Keyword8,
//       'Keyword9': Keyword9,
//       'Keyword10': Keyword10,
//     });
//   }
//
// //   //ログインメソッド
//   Future<bool> teamLogin(
//       {required String teamId, required String teamPassWord}) async {
//     Query _query =
//     FirebaseFirestore.instance
//         .collection('Keyword_TBL')
//         .where('Keyword_ID', isEqualTo: teamId);
//     bool status = false;
//     if(_query.get() == teamId) {
//       status = true;
//     }
//     return status;
//   }
// }