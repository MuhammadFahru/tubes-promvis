import 'package:flutter/material.dart';
import 'package:flutter_app/services/investasi_service.dart';
import 'package:flutter_app/services/wallet_service.dart';

class InvestasiProvider with ChangeNotifier {
  Future<bool> bayar(int? userId, int? pinjamanId, double? jumlah) async {
    try {
      if (await InvestasiService().bayar(userId, pinjamanId, jumlah)) {
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
