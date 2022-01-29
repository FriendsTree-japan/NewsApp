import 'package:NewsApp/02_Functions/FireBase.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:NewsApp/main.dart';
import '011_Adomob.dart';
import './../02_Functions/FireBase.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var playKeyWord1Ctl = TextEditingController();
  var playKeyWord2Ctl = TextEditingController();
  var playKeyWord3Ctl = TextEditingController();
  var workKeyWord1Ctl = TextEditingController();
  var workKeyWord2Ctl = TextEditingController();
  var workKeyWord3Ctl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(FirestoreMethod.getCheck =="1"){
      playKeyWord1Ctl = TextEditingController(text:FirestoreMethod.getPlayKeyWord1);
      playKeyWord2Ctl = TextEditingController(text:FirestoreMethod.getPlayKeyWord2);
      playKeyWord3Ctl = TextEditingController(text:FirestoreMethod.getPlayKeyWord3);
      workKeyWord1Ctl = TextEditingController(text:FirestoreMethod.getWorkKeyWord1);
      workKeyWord2Ctl = TextEditingController(text:FirestoreMethod.getWorkKeyWord2);
      workKeyWord3Ctl = TextEditingController(text:FirestoreMethod.getWorkKeyWord3);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Newshome()));},),
          iconTheme: IconThemeData(color: Colors.black54),
          backgroundColor: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xF5FFFFFA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Text("　仕事での検索キーワード", style: TextStyle(fontSize: 16,color: Colors.black38)),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(15),),
                  height: 200,
                  width: 350,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            TextField(
                              controller: workKeyWord1Ctl,
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                  hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
                              controller: workKeyWord2Ctl,
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
                              controller: workKeyWord3Ctl,
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),)
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text("　プライベートでの検索キーワード", style: TextStyle(fontSize: 16,color: Colors.black38)),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(15),),
                  height: 200,
                  width: 350,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            TextField(
                              controller: playKeyWord1Ctl,
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
                              controller: playKeyWord2Ctl,
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
                              controller: playKeyWord3Ctl,
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),)
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), //角の丸み
                    ),
                    label: Text('キーワードを登録する'),
                    backgroundColor:
                    const Color(0xFF4CAF50),
                    onPressed: () async{
                      await FirestoreMethod.addKeyword(playKeyWord1Ctl.text,playKeyWord2Ctl.text,playKeyWord3Ctl.text,workKeyWord1Ctl.text,workKeyWord2Ctl.text,workKeyWord3Ctl.text);
                    }
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Align(
            alignment: Alignment.bottomCenter,
            child: AdBanner(size: AdSize.banner),),
        ],
      )
    );
  }
}




