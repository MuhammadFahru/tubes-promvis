import 'package:flutter/material.dart';
import 'package:flutter_app/data_usaha.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_pribadi.dart';
import 'profile_setting.dart';
import 'support.dart';

class ProfileItem {}

class ProfileCubit extends Cubit<ProfileItem> {
  ProfileCubit() : super(ProfileItem());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        backgroundColor: Color(int.parse('0xffDBDBDB')),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 15, vertical: 20), // Add margin here
          child: SingleChildScrollView(
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
                          builder: (context) => DataUsaha(),
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
        ),
      ),
    );
  }
}
