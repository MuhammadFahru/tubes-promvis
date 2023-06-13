import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_funding_peminjam.dart';
import 'payment.dart';
import 'payment_detail.dart';
import 'notification.dart';
import 'package:flutter_app/theme.dart';

/// Wallet Cubit
/// crosscheck value later
class WalletCubit extends Cubit<double> {
  WalletCubit() : super(0.0);

  void updateWalletValue(double value) {
    emit(value);
  }
}

class HomeItem {}

class HomeCubit extends Cubit<HomeItem> {
  HomeCubit() : super(HomeItem());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WalletCubit>(
            create: (context) => WalletCubit(),
          ),
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        ],
        child: Scaffold(
            backgroundColor: Color(int.parse('0xffDBDBDB')),
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                'Home',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                    color: primaryColor,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationPage(),
                          ));
                    },
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  color: backgroundColor6,
                  child: Column(
                    children: [
                      WalletModule(),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 30),
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16, left: 16, right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text("Tagihan Selanjutnya",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white))),
                                    Container(
                                        child: Text("Rp1.000.000",
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                    const SizedBox(height: 16.0),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.calendar_month),
                                            color: primaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Container(
                                          child: Text("3 Juni 2023",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(width: 24.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text("2 hari lagi",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: alertColor)))),
                                    const SizedBox(height: 28.0),
                                    Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: SizedBox(
                                        height: 64.0,
                                        width: 64.0,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentFundingPage(),
                                                ));
                                          },
                                          iconSize: 48,
                                          icon: Icon(Icons.payment),
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text("Peminjaman Anda",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailFundingPage(),
                                ),
                              );
                            },
                            child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 8, left: 0, right: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: Image.network(
                                              'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                                              height: 64.0,
                                              width: 64.0,
                                            ),
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Modal Dagang Warung",
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                Text("Penjanjian Pendanaan",
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.grey)),
                                              ]),
                                          Container(
                                              margin: new EdgeInsets.symmetric(
                                                  horizontal: 0.0),
                                              decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text("Ongoing",
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12.0),
                                              child: Column(
                                                children: [
                                                  Text("TOTAL",
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("TAGIHAN",
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("Rp5.000.000"),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, right: 12.0),
                                              child: Column(
                                                children: [
                                                  Text("TOTAL",
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("DIBAYAR",
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("Rp4.000.000"),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, right: 12.0),
                                              child: Column(
                                                children: [
                                                  Text("TENOR",
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("WAKTU",
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("5 Minggu"),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: new LinearPercentIndicator(
                                            width: 300,
                                            animation: true,
                                            lineHeight: 20.0,
                                            animationDuration: 800,
                                            percent: 0.8,
                                            center: Text("4 Minggu",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            linearStrokeCap:
                                                LinearStrokeCap.roundAll,
                                            progressColor: primaryColor,
                                          ),
                                        ),
                                        Text("80.0%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor)),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  )),
            )));
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
              const EdgeInsets.only(top: 0, bottom: 12, left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(
                      //   'Saldo Wallet',
                      //   style: TextStyle(fontSize: 14.0, color: Colors.white),
                      // ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Rp$walletValue,00',
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.deepPurple),
                      ),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 28.0,
                        width: 28.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple,
                        ),
                        child: IconButton(
                          iconSize: 12,
                          onPressed: () {
                            Navigator.pushNamed(context, '/topUp');
                          },
                          icon: Icon(Icons.add),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Top Up',
                        style:
                            TextStyle(fontSize: 12, color: Colors.deepPurple),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 28.0,
                        width: 28.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                        child: IconButton(
                          iconSize: 12,
                          onPressed: () {},
                          icon: Icon(Icons.arrow_downward_rounded),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Withdraw',
                        style:
                            TextStyle(fontSize: 12, color: Colors.deepPurple),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 28.0,
                        width: 28.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                        child: IconButton(
                          iconSize: 12,
                          onPressed: () {},
                          icon: Icon(Icons.sticky_note_2),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'History',
                        style:
                            TextStyle(fontSize: 12, color: Colors.deepPurple),
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
