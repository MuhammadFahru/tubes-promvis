import 'package:flutter_bloc/flutter_bloc.dart';

class WalletCubit extends Cubit<int> {
  WalletCubit() : super(0);

  void updateWalletValue(int value) {
    emit(value);
  }

  void topup() {
    ///
    /// code to perform top up
    ///
  }

  void withdraw() {
    ///
    /// code to withdraw money
    ///
  }
}
