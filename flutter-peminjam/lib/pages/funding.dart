import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_funding.dart';
import 'package:flutter_app/theme.dart';

class FundingItem {
  final String title;
  final String imageUrl;
  final String fundingStatus;
  final String totalBill;
  final String totalPaid;
  final String tenor;
  final double progress;
  final String progressText;
  final String progressPercentage;

  FundingItem({
    required this.title,
    required this.imageUrl,
    required this.fundingStatus,
    required this.totalBill,
    required this.totalPaid,
    required this.tenor,
    required this.progress,
    required this.progressText,
    required this.progressPercentage,
  });
}

class FundingCubit extends Cubit<List<FundingItem>> {
  FundingCubit() : super(_initialFundingItems());

  static List<FundingItem> _initialFundingItems() {
    return [
      FundingItem(
        title: 'Modal Dagang Warung',
        imageUrl:
            'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
        fundingStatus: 'Ongoing',
        totalBill: 'Rp5.000.000',
        totalPaid: 'Rp4.000.000',
        tenor: '5 Minggu',
        progress: 0.8,
        progressText: '80.0%',
        progressPercentage: '80.0',
      ),
      FundingItem(
        title: 'Modal Renovasi Dapur',
        imageUrl:
            'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
        fundingStatus: 'Lunas',
        totalBill: 'Rp10.000.000',
        totalPaid: 'Rp10.000.000',
        tenor: '8 Minggu',
        progress: 1.0,
        progressText: '100.0%',
        progressPercentage: '100.0',
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
                    return Stack(
                      children: [
                        Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        item.imageUrl,
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
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Penjanjian Pendanaan",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: new EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      decoration: BoxDecoration(
                                        color: item.fundingStatus == 'Ongoing'
                                            ? primaryColor
                                            : Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          item.fundingStatus,
                                          style: TextStyle(
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
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "TOTAL",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "TAGIHAN",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(item.totalBill),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, right: 12.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "TOTAL",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "DIBAYAR",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(item.totalPaid),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, right: 12.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "TENOR",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "WAKTU",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(item.tenor),
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
                                    padding: EdgeInsets.all(10.0),
                                    child: LinearPercentIndicator(
                                      width: 300,
                                      animation: true,
                                      lineHeight: 20.0,
                                      animationDuration: 800,
                                      percent: item.progress,
                                      center: Text(
                                        item.progressText,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor:
                                          item.fundingStatus == 'Ongoing'
                                              ? primaryColor
                                              : Colors.green,
                                    ),
                                  ),
                                  Text(
                                    item.progressPercentage,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: item.fundingStatus == 'Ongoing'
                                          ? primaryColor
                                          : Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  Divider(color: Color.fromARGB(255, 117, 117, 117)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Riwayat Peminjaman",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
class FundingItem {
  final String title;
  final String imageUrl;
  final String fundingStatus;
  final String totalBill;
  final String totalPaid;
  final String tenor;
  final double progress;
  final String progressText;
  final String progressPercentage;

  FundingItem({
    required this.title,
    required this.imageUrl,
    required this.fundingStatus,
    required this.totalBill,
    required this.totalPaid,
    required this.tenor,
    required this.progress,
    required this.progressText,
    required this.progressPercentage,
  });
}

class FundingCubit extends Cubit<List<FundingItem>> {
  FundingCubit() : super(_initialFundingItems());

  static List<FundingItem> _initialFundingItems() {
    return [
      FundingItem(
        title: 'Modal Dagang Warung',
        imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
        fundingStatus: 'Ongoing',
        totalBill: 'Rp5.000.000',
        totalPaid: 'Rp4.000.000',
        tenor: '5 Minggu',
        progress: 0.8,
        progressText: '80.0%',
        progressPercentage: '80.0',
      ),
      FundingItem(
        title: 'Modal Renovasi Dapur',
        imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
        fundingStatus: 'Lunas',
        totalBill: 'Rp10.000.000',
        totalPaid: 'Rp10.000.000',
        tenor: '8 Minggu',
        progress: 1.0,
        progressText: '100.0%',
        progressPercentage: '100.0',
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
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Sedang Berlangsung',
                                style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Riwayat Peminjaman',
                                style: secondaryTextStyle.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 70, left: 30, right: 30),
                        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: backgroundColor5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: fundingItems.map((item) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    margin: const EdgeInsets.only(right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(item.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item.fundingStatus,
                                          style: secondaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Tagihan: ',
                                              style: secondaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              item.totalBill,
                                              style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Dibayar: ',
                                              style: secondaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              item.totalPaid,
                                              style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Text(
                                              'Tenor: ',
                                              style: secondaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              item.tenor,
                                              style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        LinearPercentIndicator(
                                          padding: EdgeInsets.zero,
                                          lineHeight: 6,
                                          percent: item.progress,
                                          linearGradient: LinearGradient(
                                            colors: [
                                              primaryColor,
                                              primaryColor.withOpacity(0.3),
                                            ],
                                          ),
                                          backgroundColor: backgroundColor4,
                                          progressColor: primaryColor,
                                          animation: true,
                                          animationDuration: 1000,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.progressText,
                                              style: primaryTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              item.progressPercentage + '%',
                                              style: primaryTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FormFundingPage()));
          },
          child: Icon(Icons.add),
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}
*/
