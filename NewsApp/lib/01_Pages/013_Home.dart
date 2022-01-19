import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';
import 'package:news_api_flutter_package/model/source.dart';
import 'package:NewsApp/01_Pages/016_PersonalSet.dart';
import 'package:NewsApp/01_Pages/017_WorkSet.dart';
import 'package:NewsApp/01_Pages/018_PlaySet.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  final NewsAPI _newsAPI = NewsAPI("c62bed8df3b542f09c66043ca4a6c916");
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabPage(0),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class TabPage extends StatelessWidget {
  final _tab = <Tab>[
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('　Work'),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('　Play'),
        ],
      ),
    ),
  ];

  @override
  int _screen = 0;

  TabPage(int curPage) {
    this._screen = curPage;
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _screen,
      length: _tab.length,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PersonalSet()
                      ));
                    },
                  ),
                ],
                iconTheme: const IconThemeData(
                  color: Colors.black54,
                ),
                backgroundColor: const Color(0xFFFFFFFF),
                bottom: TabBar(
                  tabs: _tab,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.black54,
                ),
              ),
            )),
        drawer: Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 60.0,
                  child: DrawerHeader(
                    child: Text("メニュー"),
                    decoration: BoxDecoration(),
                  ),
                ),
                ListTile(
                  title: Text('問い合わせ',
                      style: TextStyle(
                      )),
                  // onTap: _FAQURL,
                ),
                ListTile(
                  title: Text('利用規約',
                      style: TextStyle(
                      )),
                  // onTap: _rulesURL,
                ),
                ListTile(
                  title: Text('ソフトウェアライセンス',
                      style: TextStyle(
                      )),
                  onTap: () => showLicensePage(
                    context: context,
                    applicationName: 'NewsApp',
                    applicationVersion: '1.0.0',
                  ),
                )
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            PlaySet(),
            PlaySet(),
          ],
        ),
      ),
    );
  }}

void _manualURL(String getUrl) async {
  print(getUrl);
  String url = getUrl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}










// import 'package:flutter/material.dart';
// import 'package:news_api_flutter_package/model/article.dart';
// import 'package:news_api_flutter_package/model/error.dart';
// import 'package:news_api_flutter_package/model/source.dart';
// import 'package:news_api_flutter_package/news_api_flutter_package.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class HomePage extends StatelessWidget {
//   final NewsAPI _newsAPI = NewsAPI("c62bed8df3b542f09c66043ca4a6c916");
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: _buildAppBar(),
//         drawer: Drawer(
//           child: ListView(
//             children: <Widget>[
//               Container(
//                 height: 60.0,
//                 child: DrawerHeader(
//                   child: Text("メニュー"),
//                   decoration: BoxDecoration(),
//                 ),
//               ),
//               ListTile(
//                 title: Text('問い合わせ',
//                     style: TextStyle(
//                     )),
//                 // onTap: _manualURL,
//               ),
//               ListTile(
//                 title: Text('利用規約',
//                     style: TextStyle(
//                     )),
//                 // onTap: _manualURL,
//               ),
//               ListTile(
//                 title: Text('ソフトウェアライセンス',
//                     style: TextStyle(
//                     )),
//                 onTap: () => showLicensePage(
//                   context: context,
//                   applicationName: 'NewsApp',
//                   applicationVersion: '1.0.0',
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       bottom: _buildTabBar(),
//       iconTheme: IconThemeData(color: Colors.black54),
//       backgroundColor: Colors.white,
//       actions: [
//         IconButton(
//           icon: Icon(Icons.notifications_outlined),
//           onPressed: () => {},
//         ),
//       ],
//     );
//   }
//
//   TabBar _buildTabBar() {
//     return TabBar(
//       labelColor: Colors.green,
//       unselectedLabelColor: Colors.black54,
//       indicatorColor: Colors.green,
//       tabs: [
//         Tab(text: "Work"),
//         Tab(text: "Play"),
//         Tab(text: "Sources"),
//       ],
//     );
//   }
//
//   Widget _buildBody() {
//     return TabBarView(
//       children: [
//         _buildTopHeadlinesTabView(),
//         _buildEverythingTabView(),
//         _buildSourcesTabView(),
//       ],
//     );
//   }
//
//   Widget _buildTopHeadlinesTabView() {
//     return FutureBuilder<List<Article>>(
//         future: _newsAPI.getTopHeadlines(country: "ja"),
//         builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
//           return snapshot.connectionState == ConnectionState.done
//               ? snapshot.hasData
//               ? _buildArticleListView(snapshot.data)
//               : _buildError(snapshot.error as ApiError)
//               : _buildProgress();
//         });
//   }
//
//   Widget _buildEverythingTabView() {
//     return FutureBuilder<List<Article>>(
//         future: _newsAPI.getEverything(query: "サッカー"),
//         builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
//           return snapshot.connectionState == ConnectionState.done
//               ? snapshot.hasData
//               ? _buildArticleListView(snapshot.data)
//               : _buildError(snapshot.error as ApiError)
//               : _buildProgress();
//         });
//   }
//
//   Widget _buildArticleListView(List<Article>? articles) {
//     return ListView.builder(
//       itemCount: articles!.length,
//       itemBuilder: (context, index) {
//         Article article = articles[index];
//         return Card(
//           child: ListTile(
//             title: Text(article.title.toString(), maxLines: 2),
//             subtitle: Text(article.description ?? "", maxLines: 3),
//             trailing: article.urlToImage == null
//                 ? null
//                 : Image.network(article.urlToImage.toString()),
//             onTap: () {
//               _manualURL(article.url.toString());
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildSourcesTabView() {
//     return FutureBuilder<List<Source>>(
//       future: _newsAPI.getSources(),
//       builder: (BuildContext context, AsyncSnapshot<List<Source>> snapshot) {
//         return snapshot.connectionState == ConnectionState.done
//             ? snapshot.hasData
//             ? _buildSourceListView(snapshot.data)
//             : _buildError(snapshot.error as ApiError)
//             : _buildProgress();
//       },
//     );
//   }
//
//   Widget _buildSourceListView(List<Source>? sources) {
//     return ListView.builder(
//       itemCount: sources!.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             title: Text(sources[index].name.toString()),
//             subtitle: Text(sources[index].description.toString()),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildProgress() {
//     return Center(child: CircularProgressIndicator());
//   }
//
//   Widget _buildError(ApiError error) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               error.code ?? "",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 4),
//             Text(error.message.toString(), textAlign: TextAlign.center),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void _manualURL(String getUrl) async {
//   print(getUrl);
//   String url = getUrl;
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
