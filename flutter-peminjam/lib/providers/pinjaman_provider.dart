import 'package:flutter/material.dart';
import 'package:flutter_app/models/pinjaman_model.dart';
import 'package:flutter_app/services/pinjaman_service.dart';

class PinjamanProvider with ChangeNotifier {
  Future<bool> storePinjaman(String token, PinjamanModel funding) async {
    try {
      if (await PinjamanService().storePinjaman(token, funding)) {
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
