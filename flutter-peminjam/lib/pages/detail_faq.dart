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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                faq,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.network(
                'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apakah ini membantu Anda?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Iya'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Tidak'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
