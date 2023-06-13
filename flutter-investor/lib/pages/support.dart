import 'package:flutter/material.dart';

///
///Modif sesuai api
///
class SupportScreen extends StatelessWidget {
  final List<Tab> tabs = [
    Tab(text: 'Chat'),
    Tab(text: 'FAQs'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 60),
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                toolbarHeight: kToolbarHeight,
                backgroundColor: Colors.white,
                title: const Text(
                  'Customer Support',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              TabBar(
                tabs: tabs,
                indicatorColor: Colors.deepPurple,
                indicatorWeight: 3.0,
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.black,
              ),
            ],
          ),
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
                  // Navigasikan ke halaman detail FAQ dengan argumen FAQ yang dipilih
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ,
                  //   ),
                  // );
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

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final List<String> messages = [
    'Hello!',
    'How can I assist you?',
  ];
  TextEditingController _textEditingController = TextEditingController();

  void _sendMessage() {
    final message = _textEditingController.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
      });
      _textEditingController.clear();
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isMe =
                  index % 2 == 0; // Alternate between "me" and "other" user

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isMe)
                      CircleAvatar(
                        radius: 16,
                        // Replace with the sender's profile image
                        backgroundImage: AssetImage('assets/avatar2.jpeg'),
                      ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.lightBlueAccent : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style: TextStyle(
                              fontSize: 16,
                              color: isMe ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '12:34 PM', // Replace with the message timestamp
                            style: TextStyle(
                              fontSize: 12,
                              color: isMe ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isMe)
                      CircleAvatar(
                        radius: 16,
                        // Replace with the user's profile image
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}