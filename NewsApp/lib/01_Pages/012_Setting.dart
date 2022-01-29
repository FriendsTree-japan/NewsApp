import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:NewsApp/main.dart';
import '011_Adomob.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
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
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                  hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
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
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
                              maxLength: 13,
                              decoration: InputDecoration(counterText: '',
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.green,),
                                hintText: '入力してください',
                              ),
                            ),
                            Container(padding: EdgeInsets.all(2)),
                            TextField(
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
                    onPressed: (){}
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




