import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

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

class FundingCubit extends Cubit<List<FundingItem>> {
  FundingCubit() : super(_generateList());

  ///
  ///This is a pplaceholder generator
  ///
  static List<FundingItem> _generateList() {
    return List.generate(
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
            deadline: DateTime(2020)));
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

  void sortByDeadline(bool isAsc) {
    final sortedList = [...state];
    sortedList.sort((a, b) => a.deadline.compareTo(b.deadline));
    if (!isAsc) {
      sortedList.reversed;
    }
    emit(sortedList);
  }

  void sortByFundingLeft(bool isAsc) {
    final sortedList = [...state];
    sortedList.sort(
        (a, b) => (a.plafond - a.terkumpul).compareTo(b.plafond - b.terkumpul));
    if (!isAsc) {
      sortedList.reversed;
    }
    emit(sortedList);
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
          title: const Text(
            'Funding Marketplace',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            _buildSearchBar(context),
            _buildSortButtons(context),
            const SizedBox(
              height: 10,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (query) {
          context.read<FundingCubit>().search(query.toLowerCase());
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildSortButtons(BuildContext context) {
    bool isAscending = true;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            final newAscending = !isAscending;
            context.read<FundingCubit>().sortByDeadline(newAscending);
          },
          child: Text('Sort by Deadline ${isAscending ? '↑' : '↓'}'),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            final newAscending = !isAscending;
            context.read<FundingCubit>().sortByFundingLeft(newAscending);
          },
          child: Text('Sort by Plafond - Terkumpul ${isAscending ? '↑' : '↓'}'),
        ),
      ],
    );
  }

  Widget _buildDataColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
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
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: state.length,
              itemBuilder: (context, index) {
                final item = state[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Name of the funding
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // desc of the funding
                                  Text(
                                    item.desc,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///
                            ///TODO make an if to check if its lunas or not
                            ///
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Text(
                                "Lunas",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              ///
                              ///TODO make this change color and text based on it is done or not
                              child: LinearPercentIndicator(
                                lineHeight: 20.0,
                                percent:
                                    (item.terkumpul / item.plafond).toDouble(),
                                center: Text(
                                  item.plafond != item.terkumpul
                                      ? "Rp${item.terkumpul},00 / Rp ${item.plafond},00"
                                      : "Selesai",
                                  style: TextStyle(color: Colors.white),
                                ),
                                barRadius: const Radius.circular(16),
                                progressColor: item.plafond != item.terkumpul
                                    ? Color(int.parse('0xff613EEA'))
                                    : Colors.green,
                              ),
                            ),
                            const SizedBox(width: 5),

                            ///
                            ///TODO change color as well
                            ///
                            Text(
                              "${(item.terkumpul / item.plafond * 100).toDouble()}%",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: item.plafond != item.terkumpul
                                    ? Color(int.parse('0xff613EEA'))
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }));
    });
  }
}
