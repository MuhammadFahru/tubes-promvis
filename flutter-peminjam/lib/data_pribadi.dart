import 'package:flutter/material.dart';

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
