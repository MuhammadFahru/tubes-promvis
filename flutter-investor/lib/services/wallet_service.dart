import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/pinjaman_model.dart';

class WalletService {
  String baseUrl = 'http://localhost:8000/api';

  Future<bool> topUp(int? id, double? amount) async {
    var url = Uri.parse('$baseUrl/wallet/top-up');
    var headers = {
      'Content-Type': 'application/json',
      // 'Authorization': token,
    };
    var body = jsonEncode(
      {
        'users_id': id,
        'amount': amount,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Top Up!');
    }
  }

  Future<bool> withdraw(int? id, double? amount) async {
    var url = Uri.parse('$baseUrl/wallet/withdraw');
    var headers = {
      'Content-Type': 'application/json',
      // 'Authorization': token,
    };
    var body = jsonEncode(
      {
        'users_id': id,
        'amount': amount,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Top Up!');
    }
  }
}
