import 'package:flutter/material.dart';
import 'package:NewsApp/01_Pages/013_Home.dart';
import 'package:NewsApp/01_Pages/017_WorkSet.dart';

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class PersonalSet extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("Work", WorkSet()),
    TabInfo("Play", WorkSet()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black54,
          ),
          backgroundColor: const Color(0xFFFFFFFF),
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              tabs: _tabs.map((TabInfo tab) {
                return Tab(text: tab.label);
              }).toList(),
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black54,
            ),
            preferredSize: Size.fromHeight(20.0),
          ),
        ),
        body: TabBarView(children: _tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }
}