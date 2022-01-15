// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
// import '031_text_daialog.dart';
// import '032_will_pop_scope.dart';
// import '038_signin.dart';
// import '039_signup_model.dart';
// import 'package:NewsApp/01_Pages/013_Home.dart';
//
// class SignUpPage extends StatefulWidget {
//   var mailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var confirmController = TextEditingController();
//   late String mail;
//   late String password;
//   late String confirm;
//
//   SignUpPage.make(){
//     mail = "";
//     password = "";
//     confirm = "";
//   }
//
//   SignUpPage.modoru(this.mail, this.password, this.confirm){
//     this.mailController = TextEditingController(text: this.mail);
//     this.passwordController = TextEditingController(text: this.password);
//     this.confirmController = TextEditingController(text: this.confirm);
//   }
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
//
// class _SignUpPageState extends State<SignUpPage> {
//
//   var mailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var confirmController = TextEditingController();
//   late String mail;
//   late String password;
//   late String confirm;
//
//   void initState() {
//     mailController = widget.mailController;
//     passwordController = widget.passwordController;
//     confirmController = widget.confirmController;
//     mail = widget.mail;
//     password = widget.password;
//     confirm = widget.confirm;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: willPopCallback,
//       child: ChangeNotifierProvider<SignUpModel>(
//           create: (_) => SignUpModel()..init(),
//           child: Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(40.0),
//               child: AppBar(
//                 centerTitle: true,
//                 title: Text(
//                   '新規アカウント登録',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//             body: Consumer<SignUpModel>(
//               builder: (context, model, child) {
//                 return Stack(
//                   children: [
//                     Column(
//                       children: [
//                         Column(
//                           children: [
//                             Center(
//                               child: SingleChildScrollView(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Column(
//                                     children: <Widget>[
//                                       TextFormField(
//                                         controller: mailController,
//                                         onChanged: (text) {
//                                           model.changeMail(text);
//                                         },
//                                         maxLines: 1,
//                                         style: TextStyle(fontSize: 16),
//                                         decoration: InputDecoration(
//                                           errorText: model.errorMail == ''
//                                               ? null
//                                               : model.errorMail,
//                                           labelText: 'メールアドレス',
//                                           border: OutlineInputBorder(),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 16,
//                                       ),
//                                       TextFormField(
//                                         controller: passwordController,
//                                         onChanged: (text) {
//                                           model.changePassword(text);
//                                         },
//                                         obscureText: true,
//                                         maxLines: 1,
//                                         style: TextStyle(fontSize: 16),
//                                         decoration: InputDecoration(
//                                           errorText: model.errorPassword == ''
//                                               ? null
//                                               : model.errorPassword,
//                                           labelText: 'パスワード',
//                                           border: OutlineInputBorder(),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 16,
//                                       ),
//                                       TextFormField(
//                                         controller: confirmController,
//                                         onChanged: (text) {
//                                           model.changeConfirm(text);
//                                         },
//                                         obscureText: true,
//                                         maxLines: 1,
//                                         style: TextStyle(fontSize: 16),
//                                         decoration: InputDecoration(
//                                           labelText: 'パスワード（確認用）',
//                                           errorText: model.errorConfirm == ''
//                                               ? null
//                                               : model.errorConfirm,
//                                           border: OutlineInputBorder(),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 16,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                         children: [
//                                           FloatingActionButton.extended(
//                                             label: Text('ログイン画面に戻る'),
//                                             backgroundColor:
//                                             const Color(0xFF9E9E9E),
//                                             onPressed: () {
//                                               Navigator.pushReplacement(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       SignInPage(),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.fromLTRB(
//                                                 10, 20, 40, 40),
//                                           ),
//                                           FloatingActionButton.extended(
//                                               label: Text('登録'),
//                                               backgroundColor:
//                                               const Color(0xFF4CAF50),
//                                               onPressed:
//                                                   () async {
//                                                 String mail =
//                                                     mailController.text;
//                                                 String password =
//                                                     passwordController.text;
//                                                 String confirm =
//                                                     confirmController.text;
//                                                 model.mail = mail;
//                                                 model.password = password;
//                                                 model.confirm = confirm;
//                                                 model.changeMail(mail);
//                                                 model.changePassword(password);
//                                                 model.changeConfirm(confirm);
//                                                 if(model.isMailValid && model.isPasswordValid && model.isConfirmValid) {
//                                                   try {
//                                                     await model
//                                                         .passWordCheck();
//                                                     Navigator
//                                                         .pushReplacement(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                         builder: (
//                                                             context) =>
//                                                             HomePage(),
//                                                       ),
//                                                     );
//                                                     model.endLoading();
//                                                   } catch (e) {
//                                                     showTextDialog(
//                                                         context, e);
//                                                     model.endLoading();
//                                                   }
//                                                 }else{
//                                                   showTextDialog(
//                                                       context, "メール又はパスワードを正しく入力してください");
//                                                   model.endLoading();
//                                                 }
//                                               }
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             ),
//           )),
//     );
//   }
// }