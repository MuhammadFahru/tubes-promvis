import 'package:flutter/material.dart';

class DataPribadi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
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
                    fontSize: 30, // Ubah ukuran font menjadi 24
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Ridwan',
                  style: TextStyle(
                    fontSize: 30, // Ubah ukuran font menjadi 24
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
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Change Profile Picture',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 40,
                          // Your profile image or icon can be added here
                         backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20, // Ubah ukuran font menjadi 20
                        ),
                      ),
                    ),
                    Text(
                      'ridwan@gmail.com',
                      style: TextStyle(
                        fontSize: 20, // Ubah ukuran font menjadi 20
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 20, // Ubah ukuran font menjadi 20
                        ),
                      ),
                    ),
                    // Add your onTap callback for password change here
                    GestureDetector(
                      onTap: () {
                        // Handle password change
                      },
                      child: Text(
                        'Ganti Password',
                        style: TextStyle(
                          fontSize: 20, // Ubah ukuran font menjadi 20
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                    fontSize: 20, // Ubah ukuran font menjadi 20
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Nama',
                        style: TextStyle(
                          fontSize: 20, // Ubah ukuran font menjadi 20
                        ),
                      ),
                    ),
                    Text(
                      'ridwan',
                      style: TextStyle(
                        fontSize: 20, // Ubah ukuran font menjadi 20
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'No Telp',
                        style: TextStyle(
                          fontSize: 20, // Ubah ukuran font menjadi 20
                        ),
                      ),
                    ),
                    Text(
                      '0000000',
                      style: TextStyle(
                        fontSize: 20, // Ubah ukuran font menjadi 20
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'NIK',
                        style: TextStyle(
                          fontSize: 20, // Ubah ukuran font menjadi 20
                        ),
                      ),
                    ),
                    Text(
                      '000000000000',
                      style: TextStyle(
                        fontSize: 20, // Ubah ukuran font menjadi 20
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
