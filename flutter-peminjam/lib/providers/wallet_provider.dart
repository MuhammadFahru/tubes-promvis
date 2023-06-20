import 'package:flutter/material.dart';
import 'package:flutter_app/services/wallet_service.dart';

class WalletProvider with ChangeNotifier {
  Future<bool> topUp(int? id, double? amount) async {
    try {
      if (await WalletService().topUp(id, amount)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> withdraw(int? id, double? amount) async {
    try {
      if (await WalletService().withdraw(id, amount)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
