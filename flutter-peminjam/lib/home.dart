import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
              Icons.request_page_outlined,
              color: Colors.purple,
            ),
            activeIcon: Icon(Icons.request_page, color: Colors.purple),
            label: 'Funding',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, color: Colors.purple),
            activeIcon: Icon(Icons.message, color: Colors.purple),
            label: 'Support',
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

// HOME SCREEN
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Color.fromARGB(255, 213, 213, 213),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(int.parse('0xff613EEA')),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text("Tagihan Selanjutnya",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white))),
                          Container(
                              child: Text("Rp1.000.000",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  icon: Icon(Icons.calendar_month),
                                  color: Color(int.parse('0xff613EEA')),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Container(
                                child: Text("3 Juni 2023",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white)),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(width: 24.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("2 hari lagi",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)))),
                          const SizedBox(height: 24.0),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: SizedBox(
                              height: 64.0,
                              width: 64.0,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/paymentFunding');
                                },
                                iconSize: 48,
                                icon: Icon(Icons.payment),
                                color: Color(int.parse('0xff613EEA')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text("Peminjaman Anda",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(int.parse('0xff613EEA')))),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detailFunding');
                  },
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 8, left: 0, right: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.network(
                                    'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                                    height: 64.0,
                                    width: 64.0,
                                  ),
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Modal Dagang Warung",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      Text("Penjanjian Pendanaan",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey)),
                                    ]),
                                Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    decoration: BoxDecoration(
                                        color: Color(int.parse('0xff613EEA')),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Ongoing",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Column(
                                      children: [
                                        Text("TOTAL",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("TAGIHAN",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("Rp5.000.000"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12.0),
                                    child: Column(
                                      children: [
                                        Text("TOTAL",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("DIBAYAR",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("Rp4.000.000"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12.0),
                                    child: Column(
                                      children: [
                                        Text("TENOR",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("WAKTU",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("5 Minggu"),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new LinearPercentIndicator(
                                  width: 300,
                                  animation: true,
                                  lineHeight: 20.0,
                                  animationDuration: 800,
                                  percent: 0.8,
                                  center: Text("4 Minggu",
                                      style: TextStyle(color: Colors.white)),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.purple,
                                ),
                              ),
                              Text("80.0%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple)),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}

class FundingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 213, 213, 213),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: const EdgeInsets.only(
                    top: 16, bottom: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(int.parse('0xff613EEA')),
                ),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      Text("Ajukan Peminjaman",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          iconSize: 36,
                          icon: Icon(Icons.add),
                          color: Color(int.parse('0xff613EEA')),
                        ),
                      ),
                    ])),
              ),
            ],
          ),
          Divider(color: Color.fromARGB(255, 117, 117, 117)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sedang Berlangsung",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 8, left: 0, right: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.network(
                                'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                                height: 64.0,
                                width: 64.0,
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Modal Dagang Warung",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Penjanjian Pendanaan",
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey)),
                                ]),
                            Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 0.0),
                                decoration: BoxDecoration(
                                    color: Color(int.parse('0xff613EEA')),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Ongoing",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Column(
                                  children: [
                                    Text("TOTAL",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("TAGIHAN",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("Rp5.000.000"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Column(
                                  children: [
                                    Text("TOTAL",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("DIBAYAR",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("Rp4.000.000"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Column(
                                  children: [
                                    Text("TENOR",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("WAKTU",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("5 Minggu"),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: new LinearPercentIndicator(
                              width: 300,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 800,
                              percent: 0.8,
                              center: Text("4 Minggu",
                                  style: TextStyle(color: Colors.white)),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.purple,
                            ),
                          ),
                          Text("80.0%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple)),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
          Divider(color: Color.fromARGB(255, 117, 117, 117)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Riwayat Peminjaman",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 8, left: 0, right: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.network(
                                'https://assets-news.housing.com/news/wp-content/uploads/2022/03/16162704/COMMERCIAL-KITCHEN-FEATURE-compressed.jpg',
                                height: 64.0,
                                width: 64.0,
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Modal Renovasi Dapur",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Penjanjian Pendanaan",
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey)),
                                ]),
                            Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 0.0),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Lunas",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Column(
                                  children: [
                                    Text("TOTAL",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("TAGIHAN",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("Rp10.000.000"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Column(
                                  children: [
                                    Text("TOTAL",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("DIBAYAR",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("Rp10.000.000"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Column(
                                  children: [
                                    Text("TENOR",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("WAKTU",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("8 Minggu"),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: new LinearPercentIndicator(
                              width: 300,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 800,
                              percent: 1.0,
                              center: Text("Selesai",
                                  style: TextStyle(color: Colors.white)),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.green,
                            ),
                          ),
                          Text("100.0%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
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
                  backgroundImage: NetworkImage(
                      "https://media.licdn.com/dms/image/C4E03AQFnPXx0yxT4Uw/profile-displayphoto-shrink_800_800/0/1631632219753?e=2147483647&v=beta&t=4aWGfU5RFdkYI0N1gtVXIyTSYeNEoGdeIh2PlVi50xc"),
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
                  Navigator.pushNamed(context, '/');
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pribadi'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Halo,',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Nopal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Akun',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      // Your profile image or icon can be added here
                      backgroundImage: NetworkImage(
                        "https://media.licdn.com/dms/image/C4E03AQFnPXx0yxT4Uw/profile-displayphoto-shrink_800_800/0/1631632219753?e=2147483647&v=beta&t=4aWGfU5RFdkYI0N1gtVXIyTSYeNEoGdeIh2PlVi50xc",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text('Email: nopal@nopal.com'),
                ),
                ListTile(
                  title: Text('Ganti Password'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Pribadi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text('Nama: Nopal'),
                ),
                ListTile(
                  title: Text('No Telp: 0000000'),
                ),
                ListTile(
                  title: Text('NIK: 000000000000'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

