import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

///
///Modif sesuai api
///
class FundingItem {
  final String name;
  final String desc;
  final String address;
  final String imgPath;
  final int plafond;
  final double bagiHasil;
  final int tenor;
  final int terkumpul;
  final DateTime deadline;

  FundingItem({
    required this.name,
    required this.desc,
    required this.address,
    required this.imgPath,
    required this.plafond,
    required this.bagiHasil,
    required this.tenor,
    required this.terkumpul,
    required this.deadline,
  });

  ///this.deadline.difference(DateTime.now())

  FundingItem copyWith(
      String? name,
      String? desc,
      String? imgPath,
      String? address,
      int? plafond,
      double? bagiHasil,
      int? tenor,
      int? terkumpul,
      DateTime? deadline) {
    return FundingItem(
        name: name ?? this.name,
        desc: desc ?? this.desc,
        address: address ?? this.address,
        imgPath: imgPath ?? this.imgPath,
        plafond: plafond ?? this.plafond,
        bagiHasil: bagiHasil ?? this.bagiHasil,
        tenor: tenor ?? this.tenor,
        terkumpul: terkumpul ?? this.terkumpul,
        deadline: deadline ?? this.deadline);
  }
}

enum SortOption {
  deadlineAsc,
  deadlineDesc,
  toTargetAsc,
  toTargetDesc,
}

class FundingCubit extends Cubit<List<FundingItem>> {
  FundingCubit() : super(_generateList());
  SortOption selectedSortOption = SortOption.deadlineAsc;

  ///
  ///This is a pplaceholder generator
  ///
  static List<FundingItem> _generateList() {
    var temp = List.generate(
            10,
            (index) => FundingItem(
                name: 'funding $index',
                desc: 'funding ke-$index',
                address: 'alamat $index',
                imgPath: '',
                plafond: 200,
                bagiHasil: 12.5,
                tenor: 50,
                terkumpul: 100,
                deadline: DateTime(2025))) +
        List.generate(
            10,
            (index) => FundingItem(
                name: 'funding $index',
                desc: 'funding ke-$index',
                address: 'alamat $index',
                imgPath: '',
                plafond: 300,
                bagiHasil: 12.5,
                tenor: 50,
                terkumpul: 100,
                deadline: DateTime(2024)));
    temp.sort((a, b) => a.deadline.compareTo(b.deadline));
    return temp;
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(_generateList());
    } else {
      final filteredList = _generateList().where((item) {
        final name = item.name.toLowerCase();
        return name.contains(query);
      }).toList();
      emit(filteredList);
    }
  }

  void sortFundingItems(SortOption option) {
    state.sort((a, b) {
      switch (option) {
        case SortOption.deadlineAsc:
          return a.deadline.compareTo(b.deadline);
        case SortOption.deadlineDesc:
          return b.deadline.compareTo(a.deadline);
        case SortOption.toTargetAsc:
          return (a.plafond - a.terkumpul).compareTo((b.plafond - b.terkumpul));
        case SortOption.toTargetDesc:
          return (b.plafond - b.terkumpul).compareTo((a.plafond - a.terkumpul));
        default:
          return 0;
      }
    });

    emit([...state]);
  }
}

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
            'Funding Marketplace',
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

  ///
  ///TODO make the searchbar works
  ///

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
            color: Color(int.parse('0xff613EEA')),
            borderRadius: BorderRadius.circular(16.0)),
        child: DropdownButton<SortOption>(
          underline: const SizedBox(),
          style: const TextStyle(color: Colors.white),
          dropdownColor: Color(int.parse('0xff613EEA')),
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
                      ///
                      ///Navigator.pushNamed(context, '', arguments:)
                      ///
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
                                    'https://assets-news.housing.com/news/wp-content/uploads/2022/03/16162704/COMMERCIAL-KITCHEN-FEATURE-compressed.jpg',
                                    height: 64.0,
                                    width: 64.0,
                                  ),
                                ),
                                const SizedBox(width: 10),
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
                                          fontSize: 10.0,
                                          color: secondaryTextColor,
                                          fontWeight: light,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.location_pin),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            item.address,
                                            style: GoogleFonts.inter(
                                              fontSize: 8.0,
                                              color: secondaryTextColor,
                                              fontWeight: light,
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
                                  child: LinearPercentIndicator(
                                    lineHeight: 20.0,
                                    percent: (item.terkumpul / item.plafond)
                                        .toDouble(),
                                    center: Text(
                                      item.plafond != item.terkumpul
                                          ? "Rp${item.terkumpul},00 / Rp ${item.plafond},00"
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
                                ),
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
