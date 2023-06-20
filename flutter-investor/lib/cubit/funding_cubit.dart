import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/models/pinjaman_model.dart';
import 'package:flutter_app/services/pinjaman_service.dart';

abstract class FundingState {}

class InitialFunding extends FundingState {}

class LoadingFunding extends FundingState {}

class LoadedFunding extends FundingState {
  final List<PinjamanModel> pinjaman;
  LoadedFunding(this.pinjaman);
}

class ErrorFunding extends FundingState {
  final String message;

  ErrorFunding(this.message);
}

enum SortOption {
  deadlineAsc,
  deadlineDesc,
  toTargetAsc,
  toTargetDesc,
}

class FundingCubit extends Cubit<FundingState> {
  final PinjamanService _service;
  List<PinjamanModel> _fundings = [];

  FundingCubit(this._service) : super(InitialFunding()) {
    fetchFunding(3);
  }
  SortOption selectedSortOption = SortOption.deadlineAsc;

  Future<void> fetchFunding(int id, {String? query}) async {
    try {
      emit(LoadingFunding());
      _fundings = await _service.fetchPinjaman(id);
      sortFundingItems(selectedSortOption);
    } catch (e) {
      emit(ErrorFunding(e.toString()));
    }
  }

  void search(String query) {
    if (query == null || query.isEmpty) {
      sortFundingItems(selectedSortOption);
    } else {
      final result =
          _fundings.where((element) => element.nama!.contains(query)).toList();
      sortFundingItems(selectedSortOption);
    }
  }

  void sortFundingItems(SortOption option) {
    selectedSortOption = option;
    _fundings.sort((a, b) {
      switch (option) {
        case SortOption.deadlineAsc:
          return a.deadline!.compareTo(b.deadline!);
        case SortOption.deadlineDesc:
          return b.deadline!.compareTo(a.deadline!);
        case SortOption.toTargetAsc:
          return (a.plafond! - a.terkumpul!)
              .compareTo((b.plafond! - b.terkumpul!));
        case SortOption.toTargetDesc:
          return (b.plafond! - b.terkumpul!)
              .compareTo((a.plafond! - a.terkumpul!));
        default:
          return 0;
      }
    });

    emit(LoadedFunding(_fundings));
  }
}
