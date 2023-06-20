import 'package:flutter/material.dart';
import 'package:flutter_app/pages/support.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/pages/data_pribadi.dart';
import 'package:flutter_app/pages/profile_setting.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/models/user_model.dart';

///
///Modif sesuai api
///
class ProfileItem {}

class ProfileCubit extends Cubit<ProfileItem> {
  ProfileCubit() : super(ProfileItem());
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider<ProfileCubit>(
        create: (context) => ProfileCubit(),
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    // Your profile image or icon can be added here
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          user.nama!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          user.noHandphone!,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          user.email!,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Settings(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Icon(Icons.lock_open_outlined),
                  title: Row(
                    children: [
                      Text('Ubah Kode Security'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  onTap: () {
                    // Navigates to Security Code Page
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SupportScreen(), // BUG : bot navbarnya ilang
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
    );
  }
}
