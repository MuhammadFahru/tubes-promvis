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
                deadline: DateTime(2024))) +
        [
          FundingItem(
              name: 'funding 9',
              desc: 'funding ke-9',
              address: 'alamat 9',
              imgPath: '',
              plafond: 300,
              bagiHasil: 12.5,
              tenor: 50,
              terkumpul: 295,
              deadline: DateTime(2023))
        ];
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
