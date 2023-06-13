import 'package:flutter/material.dart';

import 'detail_faq.dart';

class FAQWidget extends StatefulWidget {
  @override
  _FAQWidgetState createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {
  final List<String> faqs = [
    'How do I create an account?',
    'How can I reset my password?',
    'Lorem ipsum dolor sit amet 1',
    'Lorem ipsum dolor sit amet 2',
    'Lorem ipsum dolor sit amet 3',
  ];

  final List<IconData> faqIcons = [
    Icons.account_circle,
    Icons.lock,
    Icons.question_answer,
    Icons.question_answer,
    Icons.question_answer,
  ];

  final List<String> faqSubtitles = [
    'Lorem ipsum dolor sit amet 1',
    'Lorem ipsum dolor sit amet 2',
    'Lorem ipsum dolor sit amet 3',
    'Lorem ipsum dolor sit amet 4',
    'Lorem ipsum dolor sit amet 5',
  ];

  final List<String> faqDescriptions = [
    'Description for How do I create an account?',
    'Description for How can I reset my password?',
    'Description for Lorem ipsum dolor sit amet 1',
    'Description for Lorem ipsum dolor sit amet 2',
    'Description for Lorem ipsum dolor sit amet 3',
  ];

  List<String> filteredFaqs = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredFaqs = faqs;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterFaqs(String searchText) {
    setState(() {
      filteredFaqs = faqs
          .where((faq) => faq.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            onChanged: filterFaqs,
            decoration: InputDecoration(
              labelText: 'Search FAQs',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredFaqs.length,
            itemBuilder: (context, index) {
              final faq = filteredFaqs[index];
              final icon = faqIcons[faqs.indexOf(faq)];
              final subtitle = faqSubtitles[faqs.indexOf(faq)];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailFAQ(faq: faq, faqDescriptions: faqDescriptions),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(icon),
                  title: Text(faq),
                  subtitle: Text(subtitle),
                  trailing:
                      Icon(Icons.keyboard_arrow_right), // Icon panah ke kanan
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
