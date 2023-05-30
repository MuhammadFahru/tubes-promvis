import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    FundingPage(),
    SupportPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prospera'),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.purple),
            activeIcon: Icon(Icons.home, color: Colors.purple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop_outlined,
              color: Colors.purple,
            ),
            activeIcon: Icon(Icons.shop, color: Colors.purple),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, color: Colors.purple),
            activeIcon: Icon(Icons.message, color: Colors.purple),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.purple),
            activeIcon: Icon(Icons.person, color: Colors.purple),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Main Page'),
    );
  }
}

class FundingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Funding Page'),
    );
  }
}

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
                        backgroundImage: AssetImage('assets/avatar.png'),
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

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45,
                  // Your profile image or icon can be added here
                  backgroundImage: AssetImage('assets/image/momo.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nopal',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Modal Ternak Lele',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '08123456789',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'nopal@nopal.com',
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Logic to be executed when the edit icon is pressed
                    // For example, display a dialog, navigate to an edit profile page, etc.
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Row(
                  children: [
                    Text('Data Pribadi'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                onTap: () {
                  // Navigates to Settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPribadi(),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.business),
                title: Row(
                  children: [
                    Text('Data Usaha'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                onTap: () {
                  // Navigates to Settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPribadi(),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Row(
                  children: [
                    Text('Settings'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                onTap: () {
                  // Navigates to Settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.question_mark_rounded),
                title: Row(
                  children: [
                    Text('FAQs'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                onTap: () {
                  // Navigates to FAQs page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SupportPage(),
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.login_outlined, color: Colors.red),
                title: Row(
                  children: [
                    Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.red),
                  ],
                ),
                onTap: () {
                  // Logic to be executed when the log out tile is pressed
                  // For example, navigate to log in page, display log out confirmation dialog, etc.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[400],
            ),
            ListTile(
              title: Text('Notifications'),
              trailing: CupertinoSwitch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPribadi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(
                'assets/image/momo.png',
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FractionalTranslation(
              translation: Offset(0, 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Nopal',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'nopal@nopal.com',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '08123456789',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
