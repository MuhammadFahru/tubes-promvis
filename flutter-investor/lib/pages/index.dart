import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'homeScreen.dart';
import 'portofolio.dart';
import 'funding.dart';
import 'support.dart';
import 'profile.dart';

class ScreenCubit extends Cubit<int> {
  ScreenCubit() : super(0);

  void updateScreen(int newIndex) {
    emit(newIndex);
  }
}

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomeScreen(),
    const PortofolioScreen(),
    const FundingScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenCubit>(
      create: (context) => ScreenCubit(),
      child: Scaffold(
        backgroundColor: Color(0xffDBDBDB),
        body: BlocBuilder<ScreenCubit, int>(
          builder: (context, activeScreenIndex) {
            return screens[activeScreenIndex];
          },
        ),
        bottomNavigationBar: BlocBuilder<ScreenCubit, int>(
          builder: (context, activeScreenIndex) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 1))),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.white,
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
                    icon: Icon(Icons.pie_chart_outline_rounded),
                    label: 'Portfolio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), // TODO: Custom market icon
                    label: 'Funding',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_rounded),
                    label: 'Support',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
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
