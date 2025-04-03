import 'package:flutter/material.dart';
import './routes/pages_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cooper App'),
          bottom: TabBar(tabs: tabsBarList),
        ),
        body: TabBarView(children: pagesList),
      ),
    );
  }
}
