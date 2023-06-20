import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_funding_peminjam.dart';
import 'payment.dart';
import 'payment_detail.dart';
import 'notification.dart';
import 'package:flutter_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/models/user_model.dart';

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
                      CicilanModule(
                          nextCicilan: 1100000,
                          remainingDays: 2,
                          nextDeadline: "3 Juni 2023"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Peminjaman Anda",
                            style: GoogleFonts.inter(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: primaryColor)),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                      Stack(
                        children: [
                          FundingCard(
                            imageUrl:
                                'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                            title: 'Modal Dagang Warung',
                            fundingAgreement: 'Penjanjian Pendanaan',
                            status: "Ongoing",
                            totalBilling: 5500000,
                            totalPaid: 4400000,
                            tenor: 5,
                            currentWeek: 4,
                            progressPercentage: 0.8,
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

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
                      //   style: GoogleFonts.inter(fontSize: 14.0, color: Colors.white),
                      // ),
                      const SizedBox(height: 4.0),
                      Text(user.walletBalance!.toString(),
                          style: GoogleFonts.inter(
                              fontSize: 16.0, color: primaryColor)),
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
                            Navigator.pushNamed(context, '/top-up');
                          },
                          icon: Icon(Icons.add),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Top Up',
                        style: GoogleFonts.inter(
                            fontSize: 12.0, color: primaryColor),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/withdraw');
                          },
                          icon: Icon(Icons.arrow_downward_rounded),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Withdraw',
                        style: GoogleFonts.inter(
                            fontSize: 12.0, color: primaryColor),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/history-wallet');
                          },
                          icon: Icon(Icons.sticky_note_2),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'History',
                        style: GoogleFonts.inter(
                            fontSize: 12.0, color: primaryColor),
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

class CicilanModule extends StatelessWidget {
  final int nextCicilan;
  final int remainingDays;
  final String nextDeadline;

  CicilanModule({
    required this.nextCicilan,
    required this.remainingDays,
    required this.nextDeadline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Tagihan Selanjutnya",
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "Rp" + nextCicilan.toString(),
                style: GoogleFonts.inter(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today),
                      color: whiteTextColor,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    nextDeadline,
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 8.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    '$remainingDays hari lagi',
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: alertColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: SizedBox(
                  height: 48.0,
                  width: 48.0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentFundingPage(),
                        ),
                      );
                    },
                    iconSize: 32,
                    icon: Icon(Icons.payment),
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FundingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String fundingAgreement;
  final String status;
  final int totalBilling;
  final int totalPaid;
  final int tenor;
  final int currentWeek;
  final double progressPercentage;

  FundingCard({
    required this.imageUrl,
    required this.title,
    required this.fundingAgreement,
    required this.status,
    required this.totalBilling,
    required this.totalPaid,
    required this.tenor,
    required this.currentWeek,
    required this.progressPercentage,
  });

  @override
  Widget build(BuildContext context) {
    // Replace with your desired primary color

    return GestureDetector(
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
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.only(top: 0, bottom: 8, left: 0, right: 0),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      imageUrl,
                      height: 64.0,
                      width: 64.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        fundingAgreement,
                        style: GoogleFonts.inter(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        status,
                        style: GoogleFonts.inter(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        children: [
                          Text(
                            "TOTAL",
                            style: GoogleFonts.inter(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "TAGIHAN",
                            style: GoogleFonts.inter(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rp" + totalBilling.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Column(
                        children: [
                          Text(
                            "TOTAL",
                            style: GoogleFonts.inter(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "DIBAYAR",
                            style: GoogleFonts.inter(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rp" + totalPaid.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Column(
                        children: [
                          Text(
                            "TENOR",
                            style: GoogleFonts.inter(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "WAKTU",
                            style: GoogleFonts.inter(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tenor.toString() + " Minggu",
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LinearPercentIndicator(
                    width: 300,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 800,
                    percent: progressPercentage,
                    center: Text(
                      "Angsuran ke-" + currentWeek.toString(),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                      ),
                    ),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: primaryColor,
                  ),
                ),
                Text(
                  (progressPercentage * 100).toString() + "%",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
