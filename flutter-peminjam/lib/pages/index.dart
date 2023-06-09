import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/theme.dart';

// import file
import 'profil.dart';
import 'support.dart';
import 'funding.dart';
import 'profil.dart';

class ScreenCubit extends Cubit<int> {
  ScreenCubit() : super(0);

  void updateScreen(int newIndex) {
    emit(newIndex);
  }
}

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomePage(),
    const FundingPage(showData: true),
    const SupportPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenCubit>(
      create: (context) => ScreenCubit(),
      child: Scaffold(
        body: BlocBuilder<ScreenCubit, int>(
          builder: (context, activeScreenIndex) {
            return screens[activeScreenIndex];
          },
        ),
        bottomNavigationBar: BlocBuilder<ScreenCubit, int>(
          builder: (context, activeScreenIndex) {
            return Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 3))),
              child: BottomNavigationBar(
                selectedItemColor: Color(int.parse('0xff613EEA')),
                selectedIconTheme:
                    IconThemeData(color: Color(int.parse('0xff613EEA'))),
                unselectedItemColor: Colors.grey,
                unselectedIconTheme: IconThemeData(color: Colors.grey),
                currentIndex: activeScreenIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.request_page), // TODO: Custom market icon
                    label: 'Funding',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_rounded),
                    label: 'Support',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                onTap: (index) {
                  context.read<ScreenCubit>().updateScreen(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
