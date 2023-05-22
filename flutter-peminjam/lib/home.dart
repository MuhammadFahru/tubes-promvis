import 'package:flutter/material.dart';

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
            icon: Icon(Icons.home_outlined, color: Colors.blue),
            activeIcon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop_outlined,
              color: Colors.blue,
            ),
            activeIcon: Icon(Icons.shop, color: Colors.blue),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, color: Colors.blue),
            activeIcon: Icon(Icons.message, color: Colors.blue),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.blue),
            activeIcon: Icon(Icons.person, color: Colors.blue),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Support Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nopal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        SizedBox(width: 10),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: CircleAvatar(
            radius: 50,
            // Your profile image or icon can be added here
            backgroundImage: AssetImage('assets/image'),
          ),
        ),
      ],
    );
  }
}
