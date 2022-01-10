import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';
import 'package:news_api_flutter_package/model/source.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final NewsAPI _newsAPI = NewsAPI("c62bed8df3b542f09c66043ca4a6c916");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("News API Demo"),
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(text: "Top Headlines"),
        Tab(text: "Everything"),
        Tab(text: "Sources"),
      ],
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: [
        _buildTopHeadlinesTabView(),
        _buildEverythingTabView(),
        _buildSourcesTabView(),
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

  Widget _buildEverythingTabView() {
    return FutureBuilder<List<Article>>(
        future: _newsAPI.getEverything(query: "サッカー"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
              ? _buildArticleListView(snapshot.data)
              : _buildError(snapshot.error as ApiError)
              : _buildProgress();
        });
  }

  Widget _buildArticleListView(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        Article article = articles[index];
        return Card(
          child: ListTile(
            title: Text(article.title, maxLines: 2),
            subtitle: Text(article.description ?? "", maxLines: 3),
            trailing: article.urlToImage == null
                ? null
                : Image.network(article.urlToImage),
            onTap: () async{
              await _manualURL(article.url);
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

  Widget _buildSourceListView(List<Source> sources) {
    return ListView.builder(
      itemCount: sources.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(sources[index].name),
            subtitle: Text(sources[index].description),
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
            Text(error.message, textAlign: TextAlign.center),
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
