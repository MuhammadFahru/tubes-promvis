import 'package:flutter_bloc/flutter_bloc.dart';

///
///Modif sesuai api
///
class HistoryItem {
  final String transaction_type;
  final double amount;
  final double previous_balance;
  final double current_balance;
  final DateTime date;

  HistoryItem({
    required this.transaction_type,
    required this.amount,
    required this.previous_balance,
    required this.current_balance,
    required this.date,
  });

  ///this.date.difference(DateTime.now())

  HistoryItem copyWith(String? transaction_type, double? amount,
      double? previous_balance, double? current_balance, DateTime? date) {
    return HistoryItem(
        transaction_type: transaction_type ?? this.transaction_type,
        amount: amount ?? this.amount,
        previous_balance: previous_balance ?? this.previous_balance,
        current_balance: current_balance ?? this.current_balance,
        date: date ?? this.date);
  }
}

enum SortOption {
  dateAsc,
  dateDesc,
  toTargetAsc,
  toTargetDesc,
}

class HistoryCubit extends Cubit<List<HistoryItem>> {
  HistoryCubit() : super(_generateList());
  SortOption selectedSortOption = SortOption.dateAsc;

  ///
  ///This is a pplaceholder generator
  ///
  static List<HistoryItem> _generateList() {
    var temp = List.generate(
            10,
            (index) => HistoryItem(
                transaction_type: 'History $index',
                amount: 200,
                previous_balance: 50,
                current_balance: 100,
                date: DateTime(2025))) +
        List.generate(
            10,
            (index) => HistoryItem(
                transaction_type: 'History $index',
                amount: 300,
                previous_balance: 50,
                current_balance: 100,
                date: DateTime(2024))) +
        [
          HistoryItem(
              transaction_type: 'History 9',
              amount: 300,
              previous_balance: 50,
              current_balance: 295,
              date: DateTime(2023))
        ];
    temp.sort((a, b) => a.date.compareTo(b.date));
    return temp;
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(_generateList());
    } else {
      final filteredList = _generateList().where((item) {
        final transaction_type = item.transaction_type.toLowerCase();
        return transaction_type.contains(query);
      }).toList();
      emit(filteredList);
    }
  }

  void sortHistoryItems(SortOption option) {
    state.sort((a, b) {
      switch (option) {
        case SortOption.dateAsc:
          return a.date.compareTo(b.date);
        case SortOption.dateDesc:
          return b.date.compareTo(a.date);
        case SortOption.toTargetAsc:
          return (a.amount - a.current_balance)
              .compareTo((b.amount - b.current_balance));
        case SortOption.toTargetDesc:
          return (b.amount - b.current_balance)
              .compareTo((a.amount - a.current_balance));
        default:
          return 0;
      }
    });

    emit([...state]);
  }
}
