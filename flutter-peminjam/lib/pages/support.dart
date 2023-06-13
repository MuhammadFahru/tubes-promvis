import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_support.dart';
import 'faq_support.dart';

class SupportItem {}

class SupportCubit extends Cubit<List<SupportItem>> {
  SupportCubit() : super([]);
}

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SupportCubit>(
      create: (context) => SupportCubit(),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0, // Set initial index to 0 for 'Chat' tab
        child: Scaffold(
          backgroundColor: Color(int.parse('0xffDBDBDB')),
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'Customer Support',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Chat'),
                Tab(text: 'FAQs'),
              ],
              indicatorColor: Colors.deepPurple,
              indicatorWeight: 3.0,
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.black,
            ),
          ),
          body: TabBarView(
            children: [
              ChatWidget(),
              FAQWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
