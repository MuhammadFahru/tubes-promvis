import 'package:flutter/material.dart';

import 'chat_support.dart';
import 'faq_support.dart';

class SupportPage extends StatelessWidget {
  final List<Tab> tabs = [
    Tab(text: 'Chat'),
    Tab(text: 'FAQs'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: TabBar(
          tabs: tabs,
          indicatorColor: Colors.deepPurple,
          indicatorWeight: 3.0,
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            ChatWidget(),
            FAQWidget(),
          ],
        ),
      ),
    );
  }
}
