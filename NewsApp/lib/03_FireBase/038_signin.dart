import 'package:NewsApp/02_Functions/FireBase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '031_text_daialog.dart';
import '032_will_pop_scope.dart';
import '033_password_forget_page.dart';
import '034_signin_model.dart';
import '035_singup.dart';
import 'package:NewsApp/main.dart';
import 'package:NewsApp/01_Pages/013_Home.dart';

class SignInPage extends StatelessWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopCallback,
      child: ChangeNotifierProvider<SignInModel>(
        create: (_) => SignInModel(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
                backgroundColor: Colors.green),
          ),
          body: Consumer<SignInModel>(
            builder: (context, model, child) {
              return Stack(
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
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: mailController,
                              onChanged: (text) {
                                model.changeMail(text);
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                errorText: model.errorMail == ''
                                    ? null
                                    : model.errorMail,
                                labelText: '?????????????????????',
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
                              decoration: InputDecoration(
                                errorText: model.errorPassword == ''
                                    ? null
                                    : model.errorPassword,
                                labelText: '???????????????',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: RaisedButton(
                                child: Text('????????????'),
                                color: Color(0xFF4CAF50),
                                textColor: Colors.white,
                                onPressed: model.isMailValid &&
                                    model.isPasswordValid
                                    ? () async {
                                  model.startLoading();
                                  try {
                                    await model.login();
                                    await FirestoreMethod.getKeyword(model.auth.currentUser!.uid);
                                    print(FirestoreMethod.getCheck);
                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Newshome(),
                                      ),
                                    );
                                  } catch (e) {
                                    showTextDialog(context, e.toString());
                                    model.endLoading();
                                  }
                                }
                                    : null,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            FlatButton(
                              child: Text(
                                '????????????????????????',
                              ),
                              textColor: Color(0xFF4CAF50),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage.make(),
                                  ),
                                );
                              },
                            ),
                            FlatButton(
                              child: Text(
                                '?????????????????????????????????',
                              ),
                              textColor: Colors.grey,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgetPasswordPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  model.isLoading
                      ? Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                      : SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}