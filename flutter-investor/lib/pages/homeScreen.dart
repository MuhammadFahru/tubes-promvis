import 'package:flutter/material.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
class PortfolioSumCubit extends Cubit<List<String>> {
  PortfolioSumCubit() : super([]);

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
        BlocProvider<PortfolioSumCubit>(
            create: (context) => PortfolioSumCubit()),
        BlocProvider<OngoingFundingCubit>(
            create: (context) => OngoingFundingCubit()),
      ],
      child: Scaffold(
        backgroundColor: Color(int.parse('0xffDBDBDB')),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Home',
            style: GoogleFonts.inter(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          leading: Container(
            margin: EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(int.parse('0xff613EEA'))),
            child: IconButton(
              icon: const Icon(Icons.person),
              iconSize: 30,
              onPressed: () {
                // Navigate to profile page
              },
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: Color(int.parse('0xff613EEA')),
                iconSize: 30,
                onPressed: () {
                  // Navigate to profile page
                },
              ),
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
              // portofolio section
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Portfolio',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 12),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<ScreenCubit>().updateScreen(1);
                          },
                          child: Text(
                            'more',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontSize: 12),
                          ))
                    ],
                  )),
              SizedBox(height: 8.0),
              PortfolioList(),
              SizedBox(height: 16.0),

              //ongoing funding section
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ongoing Funding',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 12),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<ScreenCubit>().updateScreen(1);
                          },
                          child: Text(
                            'more',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontSize: 12),
                          ))
                    ],
                  )),
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
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          padding:
              const EdgeInsets.only(top: 16, bottom: 32, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryColor,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Wallet',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Rp$walletValue,00',
                        style: const TextStyle(
                            fontSize: 24.0, color: Colors.white),
                      ),
                    ]),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/topUp');
                          },
                          icon: Icon(Icons.add),
                          color: Color(int.parse('0xff613EEA')),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Top Up',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_downward_rounded),
                          color: Color(int.parse('0xff613EEA')),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Withdraw',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.sticky_note_2),
                          color: Color(int.parse('0xff613EEA')),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'History',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
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
    return BlocBuilder<PortfolioSumCubit, List<String>>(
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
