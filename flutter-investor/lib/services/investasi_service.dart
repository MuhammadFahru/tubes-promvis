import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/investasi_model.dart';

class InvestasiService {
  String baseUrl = 'http://localhost:8000/api';

  Future<bool> bayar(int? usersId, int? pinjamanId, double? jumlah) async {
    var url = Uri.parse('$baseUrl/investasi/store');
    var headers = {
      'Content-Type': 'application/json',
      // 'Authorization': token,
    };
    var body = jsonEncode(
      {
        'users_id': usersId,
        'pinjaman_id': pinjamanId,
        'jumlah': jumlah,
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
      throw Exception('Gagal Investasi!');
    }
  }
}
