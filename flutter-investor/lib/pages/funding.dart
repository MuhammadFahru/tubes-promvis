import 'package:flutter/material.dart';
import 'package:flutter_app/pages/detail_funding_investor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_app/cubit/funding_cubit.dart';

class FundingScreen extends StatelessWidget {
  const FundingScreen({Key? key}) : super(key: key);

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
          title: Text(
            'Funding',
            style: GoogleFonts.inter(
                color: primaryTextColor, fontWeight: bold, fontSize: 16),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: _buildSearchBar(context)),
                  SizedBox(
                    width: 8,
                  ),
                  _buildSortButtons(context),
                ],
              ),
            ),
            _buildCardListView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return BlocBuilder<FundingCubit, List<FundingItem>>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            onChanged: (query) {
              context.read<FundingCubit>().search(query.toLowerCase());
            },
            style: TextStyle(
              color: Colors.purple, // Set the text color to purple
            ),
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none, // Remove the default border
            ),
          ),
        );
      },
    );
  }

  Widget _buildSortButtons(BuildContext context) {
    return BlocBuilder<FundingCubit, List<FundingItem>>(
        builder: (context, state) {
      DropdownMenuItem<SortOption> buildSortDropdownItem(
          SortOption option, String text) {
        return DropdownMenuItem<SortOption>(value: option, child: Text(text));
      }

      List<DropdownMenuItem<SortOption>> items = [
        buildSortDropdownItem(SortOption.deadlineAsc, 'Deadline ↑'),
        buildSortDropdownItem(SortOption.deadlineDesc, 'Deadline ↓'),
        buildSortDropdownItem(SortOption.toTargetAsc, 'Sisa ↑'),
        buildSortDropdownItem(SortOption.toTargetDesc, 'Sisa ↓')
      ];

      return Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(16.0)),
        child: DropdownButton<SortOption>(
          underline: const SizedBox(),
          style: GoogleFonts.inter(color: Colors.white),
          dropdownColor: Colors.grey,
          borderRadius: BorderRadius.circular(16.0),
          value: context.read<FundingCubit>().selectedSortOption,
          onChanged: (SortOption? newValue) {
            if (newValue != null) {
              context.read<FundingCubit>().sortFundingItems(newValue);
              context.read<FundingCubit>().selectedSortOption = newValue;
            }
          },
          items: items,
          selectedItemBuilder: (BuildContext context) {
            return items.map((DropdownMenuItem<SortOption> item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: item.child),
              );
            }).toList();
          },
        ),
      );
    });
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

  Widget _buildCardListView(BuildContext context) {
    return BlocBuilder<FundingCubit, List<FundingItem>>(
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

                String getTimeDif() {
                  final dif = item.deadline.difference(now);
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
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                      color: Color(int.parse('0xffC5B6FF')),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: primaryColor)),
                                  child: Icon(
                                    Icons.add,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildDataColumn(
                                    "TOTAL PLAFOND", "Rp${item.plafond},00"),
                                _buildDataColumn(
                                    "BAGI HASIL", "${item.bagiHasil}%"),
                                _buildDataColumn(
                                    "TENOR WAKTU", "${item.tenor} Minggu"),
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
                                      percent: (item.terkumpul / item.plafond)
                                          .toDouble(),
                                      center: Text(
                                        item.plafond != item.terkumpul
                                            ? "${((item.terkumpul / item.plafond) * 100).toStringAsFixed(4 - ((item.terkumpul / item.plafond) * 100).toInt().toString().length)}%"
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
                                        "Rp${item.terkumpul},00 / Rp${item.plafond},00",
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
