import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter_app/cubit/portofolio_cubit.dart';

class PortofolioScreen extends StatelessWidget {
  const PortofolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortofolioCubit>(
      create: (context) => PortofolioCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor6,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Portofolio',
            style: GoogleFonts.inter(
                color: primaryTextColor, fontWeight: bold, fontSize: 16),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildSummaryModule(context), _buildCardListView(context)],
        ),
      ),
    );
  }

  Widget _buildSummaryModule(BuildContext context) {
    return BlocBuilder<PortofolioCubit, List<PortofolioItem>>(
      builder: (context, state) {
        final totalPayment = state.fold<double>(
          0,
          (previousValue, lending) => previousValue + lending.terkumpul,
        );
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Total Investasi',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Rp${totalPayment},00',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardListView(BuildContext context) {
    return BlocBuilder<PortofolioCubit, List<PortofolioItem>>(
        builder: (context, state) {
      return Expanded(
          child: ListView.builder(
              primary: true,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.length,
              itemBuilder: (context, index) {
                final item = state[index];
                final now = DateTime.now();

                String sumWeeks() {
                  final diff = now.difference(item.mulai).inDays;
                  return (diff / 7).round().abs().toString();
                }

                String totalWeeks() {
                  return ((item.deadline.difference(item.mulai).inDays) / 7)
                      .round()
                      .abs()
                      .toString();
                }

                return GestureDetector(
                    onTap: () {
                      ///
                      /// detail of porto
                      ///
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.network(
                                    'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                                    height: 64.0,
                                    width: 64.0,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Name of the funding
                                      Text(
                                        item.name,
                                        style: GoogleFonts.inter(
                                          fontSize: 14.0,
                                          fontWeight: semiBold,
                                          color: primaryTextColor,
                                        ),
                                      ),
                                      // desc of the funding
                                      Text(
                                        item.desc,
                                        style: GoogleFonts.inter(
                                          fontSize: 12.0,
                                          color: secondaryTextColor,
                                          fontWeight: medium,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            size: 15,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            item.address,
                                            style: GoogleFonts.inter(
                                              fontSize: 10.0,
                                              color: secondaryTextColor,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    LinearPercentIndicator(
                                      lineHeight: 20.0,
                                      percent: (item.terkumpul / item.target)
                                          .toDouble(),
                                      center: Text(
                                        item.target != item.terkumpul
                                            ? "${((item.terkumpul / item.target) * 100).toStringAsFixed(4 - ((item.terkumpul / item.target) * 100).toInt().toString().length)}%"
                                            : "Selesai",
                                        style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontWeight: regular,
                                            fontSize: 10),
                                      ),
                                      barRadius: const Radius.circular(16),
                                      progressColor:
                                          item.target != item.terkumpul
                                              ? primaryColor
                                              : Colors.green,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Center(
                                      child: Text(
                                        "Rp${item.terkumpul},00 / Rp${item.target},00",
                                        style: GoogleFonts.inter(
                                            color: primaryTextColor,
                                            fontWeight: semiBold,
                                            fontSize: 10),
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(width: 10),
                                Text(
                                  "${sumWeeks()} / ${totalWeeks()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        item.deadline.difference(now).inHours >=
                                                1
                                            ? secondaryTextColor
                                            : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
              }));
    });
  }
}
