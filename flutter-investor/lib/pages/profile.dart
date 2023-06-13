import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: SingleChildScrollView(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}
