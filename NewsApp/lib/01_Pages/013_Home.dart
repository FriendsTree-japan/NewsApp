import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';
import 'package:news_api_flutter_package/model/source.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatelessWidget {
  final NewsAPI _newsAPI = NewsAPI("f0fba5cf454b49d38770bc5e983d99c2");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: _buildAppBar(),
        ),
        backgroundColor: const Color(0xF5FFFFFA),
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
                // onTap: _manualURL,
              ),
              ListTile(
                title: Text('利用規約',
                    style: TextStyle(
                    )),
                // onTap: _manualURL,
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
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: _buildTabBar(),
      iconTheme: IconThemeData(color: Colors.black54),
      backgroundColor: Colors.white,
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      labelColor: Colors.green,
      unselectedLabelColor: Colors.black54,
      indicatorColor: Colors.green,
      tabs: [
        Tab(text: "仕事"),
        Tab(text: "プライベート"),
      ],
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: [
        _buildWorkTabView(),
        _buildPlayTabView(),
      ],
    );
  }

  Widget _buildTopHeadlinesTabView() {
    return FutureBuilder<List<Article>>(
        future: _newsAPI.getTopHeadlines(country: "ja"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
              ? _buildArticleListView(snapshot.data)
              : _buildError(snapshot.error as ApiError)
              : _buildProgress();
        });
  }

  Widget _buildWorkTabView() {
    return FutureBuilder<List<Article>>(
        future: _newsAPI.getEverything(query: "テクノロジー"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
              ? _buildArticleListView(snapshot.data)
              : _buildError(snapshot.error as ApiError)
              : _buildProgress();
        });
  }

  Widget _buildPlayTabView() {
    return FutureBuilder<List<Article>>(
        future: _newsAPI.getEverything(query: "村上春樹"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
              ? _buildArticleListView(snapshot.data)
              : _buildError(snapshot.error as ApiError)
              : _buildProgress();
        });
  }

  Widget _buildArticleListView(List<Article>? articles) {
    return ListView.builder(
      itemCount: articles!.length,
      itemBuilder: (context, index) {
        Article article = articles[index];
        return Card(
          child: ListTile(
            title: Text(article.title.toString(), maxLines: 2),
            subtitle: Text(article.description ?? "", maxLines: 3),
            trailing: article.urlToImage == null
                ? null
                : Image.network(article.urlToImage.toString()),
            onTap: () {
              _manualURL(article.url.toString());
            },
          ),
        );
      },
    );
  }

  Widget _buildSourcesTabView() {
    return FutureBuilder<List<Source>>(
      future: _newsAPI.getSources(),
      builder: (BuildContext context, AsyncSnapshot<List<Source>> snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
            ? _buildSourceListView(snapshot.data)
            : _buildError(snapshot.error as ApiError)
            : _buildProgress();
      },
    );
  }

  Widget _buildSourceListView(List<Source>? sources) {
    return ListView.builder(
      itemCount: sources!.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(sources[index].name.toString()),
            subtitle: Text(sources[index].description.toString()),
          ),
        );
      },
    );
  }

  Widget _buildProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildError(ApiError error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.code ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(error.message.toString(), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

void _manualURL(String getUrl) async {
  print(getUrl);
  String url = getUrl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}