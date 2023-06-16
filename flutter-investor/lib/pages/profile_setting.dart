import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
        centerTitle: true,
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
