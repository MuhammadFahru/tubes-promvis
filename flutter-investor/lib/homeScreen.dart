import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Wallet Cubit
/// crosscheck value later
class WalletCubit extends Cubit<double> {
  WalletCubit() : super(0.0);

  void updateWalletValue(double value) {
    emit(value);
  }
}

/// Portfolio Cubit
/// temp value for now
class PortfolioCubit extends Cubit<List<String>> {
  PortfolioCubit() : super([]);

  void updatePortfolio(List<String> portfolioList) {
    emit(portfolioList);
  }
}

/// Ongoing Funding Cubit
/// placeholder states
class OngoingFundingCubit extends Cubit<List<String>> {
  OngoingFundingCubit() : super([]);

  void updateOngoingFunding(List<String> fundingList) {
    emit(fundingList);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WalletCubit>(
          create: (context) => WalletCubit(),
        ),
        BlocProvider<PortfolioCubit>(create: (context) => PortfolioCubit()),
        BlocProvider<OngoingFundingCubit>(
            create: (context) => OngoingFundingCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Navigate to profile page
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Navigate to notifications page
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              WalletModule(),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Portfolio',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0),
              PortfolioList(),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Ongoing Funding',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0),
              OngoingFundingList(),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, double>(
      builder: (context, walletValue) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          padding: EdgeInsets.only(top: 16, bottom: 32, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(int.parse('0xff613EEA')),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Wallet',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Rp${walletValue},00',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                    ]),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          icon: Icon(Icons.man_rounded)),
                      Text(
                        'Top Up',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle withdraw button pressed
                    },
                    child: Text('Withdraw'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle history button pressed
                    },
                    child: Text('History'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class PortfolioList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, List<String>>(
      builder: (context, portfolioList) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: portfolioList.length,
          itemBuilder: (context, index) {
            final item = portfolioList[index];
            return Card(
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        );
      },
    );
  }
}

class OngoingFundingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OngoingFundingCubit, List<String>>(
      builder: (context, fundingList) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: fundingList.length,
          itemBuilder: (context, index) {
            final item = fundingList[index];
            return Card(
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        );
      },
    );
  }
}
