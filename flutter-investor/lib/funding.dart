import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

enum SortingOption {
  deadlineAsc,
  deadlineDesc,
  amountLeftAsc,
  amountLeftDesc,
}

class FundingCubit extends Cubit<List<FundingItem>> {
  List<FundingItem> allItems = _generateList();
  String searchQuery = '';
  List<String> selectedTags = [];
  SortingOption sortingOption = SortingOption.deadlineAsc;

  FundingCubit(this.allItems) : super(allItems);

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

  void searchFunding(String query) {
    searchQuery = query.toLowerCase();
    emit(_getFilteredAndSortedFundingItems());
  }

  void toggleTagFilter(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
    emit(_getFilteredAndSortedFundingItems());
  }

  void setSortingOption(SortingOption option) {
    sortingOption = option;
    emit(_getFilteredAndSortedFundingItems());
  }

  List<FundingItem> _getFilteredAndSortedFundingItems() {
    List<FundingItem> filteredItems = allItems.where((item) {
      // Apply search query filter
      if (searchQuery.isNotEmpty &&
          !item.name.toLowerCase().contains(searchQuery)) {
        return false;
      }

      // Apply tag filter
      if (selectedTags.isNotEmpty &&
          !selectedTags.any((tag) => item.tags.contains(tag))) {
        return false;
      }

      return true;
    }).toList();

    // Apply sorting option
    filteredItems.sort((a, b) {
      switch (sortingOption) {
        case SortingOption.deadlineAsc:
          return a.deadline.compareTo(b.deadline);
        case SortingOption.deadlineDesc:
          return b.deadline.compareTo(a.deadline);
        case SortingOption.amountLeftAsc:
          return (a.plafond - a.terkumpul).compareTo((b.plafond - b.terkumpul));
        case SortingOption.amountLeftDesc:
          return (b.plafond - b.terkumpul).compareTo((a.plafond - a.terkumpul));
      }
    });

    return filteredItems;
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            _buildSearchBar(),
          ],
        )),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSortingOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sort By:'),
          DropdownButton<String>(
            value: 'Ending Soon',
            onChanged: (newValue) {},
            items: <String>['Ending Soon', 'Amount Left', 'Other Options']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTags() {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          _buildTag('Food', false),
          _buildTag('Fashion', true),
          _buildTag('Farm', false),
        ],
      ),
    );
  }

  Widget _buildTag(String tag, bool isSelected) {
    final color = isSelected ? Colors.blue : Colors.grey;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(tag),
        backgroundColor: color,
      ),
    );
  }
}
