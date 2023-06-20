import 'package:flutter/material.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter_app/cubit/funding_cubit.dart';
import 'package:flutter_app/cubit/portofolio_cubit.dart';
import 'package:flutter_app/cubit/wallet_cubit.dart';
import 'package:flutter_app/pages/detail_funding_investor.dart';
import 'package:flutter_app/services/pinjaman_service.dart';

import 'package:provider/provider.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WalletCubit>(
          create: (context) => WalletCubit(),
        ),
        BlocProvider<PortofolioCubit>(create: (context) => PortofolioCubit()),
        BlocProvider<FundingCubit>(
            create: (context) => FundingCubit(PinjamanService())),
      ],
      child: Scaffold(
        backgroundColor: backgroundColor6,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Home',
            style: GoogleFonts.inter(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
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
                color: primaryColor,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 32.0,
              ),
              WalletModule(),
              SizedBox(height: 32.0),
              // portofolio section
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Portofolio',
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
              _buildCardListViewPorto(context),
              SizedBox(
                height: 32.0,
              ),
              //funding recommended
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Funding Rekomendasi',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 12),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<ScreenCubit>().updateScreen(2);
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
              _buildCardListViewFunding(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12.0,
            fontWeight: semiBold,
            color: primaryTextColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: medium,
            color: primaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCardListViewPorto(BuildContext context) {
    return BlocBuilder<PortofolioCubit, List<PortofolioItem>>(
        builder: (context, state) {
      return SizedBox(
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: true,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 3,
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
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: item.deadline
                                                  .difference(now)
                                                  .inHours >=
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
                      ),
                    ));
              }));
    });
  }

  Widget _buildCardListViewFunding(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fundingCubit = context.read<FundingCubit>();
      fundingCubit.fetchFunding(3);
    });
    return BlocConsumer<FundingCubit, FundingState>(listener: (context, state) {
      if (state is ErrorFunding) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
    }, builder: (context, state) {
      if (state is LoadingFunding) {
        return Center(child: CircularProgressIndicator());
      } else if (state is LoadedFunding) {
        return Expanded(
            child: ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.pinjaman.length,
                itemBuilder: (context, index) {
                  final item = state.pinjaman[index];
                  final now = DateTime.now();

                  String getTimeDif() {
                    final dif = item.deadline!.difference(now);
                    if (dif.inDays >= 1) {
                      return "${dif.inDays} Hari";
                    } else if (dif.inHours >= 1) {
                      return "${dif.inHours} Jam";
                    } else if (dif.inMinutes >= 1) {
                      return "${dif.inMinutes} Menit";
                    } else {
                      return "<1 Menit";
                    }
                  }

                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailFundingPage(),
                          ),
                        );
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
                                          item.nama!,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            fontWeight: semiBold,
                                            color: primaryTextColor,
                                          ),
                                        ),
                                        // desc of the funding
                                        Text(
                                          item.deskripsi!,
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
                                              item.alamat!,
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
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                        color: Color(int.parse('0xffC5B6FF')),
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Icon(
                                      Icons.add,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildDataColumn(
                                      "TOTAL PLAFOND", "Rp${item.plafond}"),
                                  _buildDataColumn(
                                      "BAGI HASIL", "${item.bagiHasil}%"),
                                  _buildDataColumn(
                                      "TENOR WAKTU", "${item.tenor} Minggu"),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      LinearPercentIndicator(
                                        lineHeight: 20.0,
                                        percent:
                                            (item.terkumpul! / item.plafond!)
                                                .toDouble(),
                                        center: Text(
                                          item.plafond != item.terkumpul
                                              ? "${((item.terkumpul! / item.plafond!) * 100).toStringAsFixed(4 - ((item.terkumpul! / item.plafond!) * 100).toInt().toString().length)}%"
                                              : "Selesai",
                                          style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontWeight: regular,
                                              fontSize: 10),
                                        ),
                                        barRadius: const Radius.circular(16),
                                        progressColor:
                                            item.plafond != item.terkumpul
                                                ? primaryColor
                                                : Colors.green,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Center(
                                        child: Text(
                                          "Rp${item.terkumpul!.toInt()} / Rp${item.plafond}",
                                          style: GoogleFonts.inter(
                                              color: primaryTextColor,
                                              fontWeight: semiBold,
                                              fontSize: 10),
                                        ),
                                      )
                                    ],
                                  )),
                                  const SizedBox(width: 5),
                                  Text(
                                    getTimeDif(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: item.deadline!
                                                  .difference(now)
                                                  .inHours >=
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
      } else {
        return Center(child: Text('No data'));
      }
    });
  }
}

class WalletModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return BlocBuilder<WalletCubit, int>(
      builder: (context, walletValue) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
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
                      Text(
                        'Total Wallet',
                        style: GoogleFonts.inter(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: regular),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Rp${user.walletBalance},00',
                        style: GoogleFonts.inter(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: bold),
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
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Top Up',
                        style: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: regular),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/withdraw');
                          },
                          icon: Icon(Icons.arrow_downward_rounded),
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Withdraw',
                        style: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: regular),
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
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'History',
                        style: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: regular),
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
