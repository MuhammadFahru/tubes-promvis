import 'package:flutter/material.dart';

class DetailFAQ extends StatelessWidget {
  final String faq;
  final List<String> faqDescriptions;

  DetailFAQ({required this.faq, required this.faqDescriptions});

  @override
  Widget build(BuildContext context) {
    final String description = faqDescriptions.firstWhere(
      (element) => element.contains(faq),
      orElse: () => '',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail FAQ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                faq,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Image.network(
              'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
