import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:NewsApp/main.dart';
import '031_text_daialog.dart';
import '032_will_pop_scope.dart';
import '038_signin.dart';
import '039_signup_model.dart';
import 'package:NewsApp/01_Pages/013_Home.dart';

class SignUpPage extends StatefulWidget {
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  late String mail;
  late String password;
  late String confirm;

  SignUpPage.make(){
  }

  SignUpPage.modoru(this.mail, this.password, this.confirm){
    this.mailController = TextEditingController(text: this.mail);
    this.passwordController = TextEditingController(text: this.password);
    this.confirmController = TextEditingController(text: this.confirm);
  }
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  //ページ1より
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  void initState() {
    mailController = widget.mailController;
    passwordController = widget.passwordController;
    confirmController = widget.confirmController;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopCallback,
      child: ChangeNotifierProvider<SignUpModel>(
          create: (_) => SignUpModel()..init(),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: AppBar(
                backgroundColor: Colors.green,
              ),
            ),
            body: Consumer<SignUpModel>(
              builder: (context, model, child) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.all(70)),
                        Column(
                          children: [
                            Center(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child:
                                            Image.asset('images/FriendsTree.png'),
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller: mailController,
                                        onChanged: (text) {
                                          model.changeMail(text);
                                        },
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 16),
                                        decoration: InputDecoration(
                                          errorText: model.errorMail == ''
                                              ? null
                                              : model.errorMail,
                                          labelText: 'メールアドレス',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        onChanged: (text) {
                                          model.changePassword(text);
                                        },
                                        obscureText: true,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 16),
                                        decoration: InputDecoration(
                                          errorText: model.errorPassword == ''
                                              ? null
                                              : model.errorPassword,
                                          labelText: 'パスワード',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        controller: confirmController,
                                        onChanged: (text) {
                                          model.changeConfirm(text);
                                        },
                                        obscureText: true,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 16),
                                        decoration: InputDecoration(
                                          labelText: 'パスワード（確認用）',
                                          errorText: model.errorConfirm == ''
                                              ? null
                                              : model.errorConfirm,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),

                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          FloatingActionButton.extended(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), //角の丸み
                                              ),
                                              label: Text('新規登録'),
                                              backgroundColor:
                                              const Color(0xFF4CAF50),
                                              onPressed: () async {
                                                try {
                                                    await model.signUp();
                                                    await Navigator
                                                        .pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Newshome(),
                                                      ),
                                                    );
                                                    model.endLoading();
                                                  } catch(e){
                                                  showTextDialog(
                                                      context, e);
                                                  model.endLoading();
                                                }}
                                          ),
                                          FlatButton(
                                            child: Text(
                                              'ログイン画面に戻る',
                                            ),
                                            textColor: Color(0xFF9E9E9E),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => SignInPage(),
                                                ),
                                              );
                                            },
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }
}
