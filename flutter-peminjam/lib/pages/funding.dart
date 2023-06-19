import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_funding.dart';
import 'package:flutter_app/theme.dart';
import 'detail_funding_peminjam.dart';

class FundingCubit extends Cubit<List<FundingItem>> {
  FundingCubit() : super(_initialFundingItems());

  static List<FundingItem> _initialFundingItems() {
    return [
      FundingItem(
        title: 'Modal Dagang Warung',
        imageUrl:
            'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
        status: 'Ongoing',
        totalBilling: 5500000,
        fundingAgreement: 'Perjanjian Pendanaan',
        totalPaid: 4400000,
        tenor: 5,
        currentWeek: 4,
        progressPercentage: 0.8,
      ),
      FundingItem(
        title: 'Modal Renovasi Dapur',
        imageUrl:
            'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
        status: 'Lunas',
        fundingAgreement: 'Perjanjian Pendanaan',
        totalBilling: 11000000,
        totalPaid: 11000000,
        tenor: 8,
        currentWeek: 8,
        progressPercentage: 1.0,
      ),
    ];
  }
}

class FundingPage extends StatelessWidget {
  const FundingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FundingCubit>(
      create: (context) => FundingCubit(),
      child: Scaffold(
        backgroundColor: Color(int.parse('0xffDBDBDB')),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Funding',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<FundingCubit, List<FundingItem>>(
          builder: (context, fundingItems) {
            return Container(
              width: double.infinity,
              color: backgroundColor6,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Ajukan Peminjaman",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FormFundingPage(),
                                      ),
                                    );
                                  },
                                  iconSize: 36,
                                  icon: Icon(Icons.add),
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Color.fromARGB(255, 117, 117, 117)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sedang Berlangsung",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ...fundingItems.map((item) {
                    return FundingItem(
                      imageUrl: item.imageUrl,
                      title: item.title,
                      fundingAgreement: item.fundingAgreement,
                      status: item.status,
                      totalBilling: item.totalBilling,
                      totalPaid: item.totalPaid,
                      tenor: item.tenor,
                      currentWeek: item.currentWeek,
                      progressPercentage: item.progressPercentage,
                    );
                  }).toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FundingItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String fundingAgreement;
  final String status;
  final int totalBilling;
  final int totalPaid;
  final int tenor;
  final int currentWeek;
  final double progressPercentage;

  FundingItem({
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
                      color: status == 'Ongoing' ? primaryColor : Colors.green,
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
                    progressColor:
                        status == 'Ongoing' ? primaryColor : Colors.green,
                  ),
                ),
                Text(
                  (progressPercentage * 100).toString() + "%",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: status == 'Ongoing' ? primaryColor : Colors.green,
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
