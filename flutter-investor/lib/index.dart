import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'homeScreen.dart';

class ScreenCubit extends Cubit<int> {
  ScreenCubit() : super(0);

  void updateScreen(int newIndex) {
    emit(newIndex);
  }
}

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    HomeScreen(),
    PortfolioScreen(),
    MarketplaceScreen(),
    SupportScreen(),
    ProfileScreen(),
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
            return BottomNavigationBar(
              currentIndex: activeScreenIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.folder),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Marketplace',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.support),
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
            );
          },
        ),
      ),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Portfolio Screen',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Marketplace Screen',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Support Screen',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile Screen',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
