import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/pinjaman_model.dart';

class PinjamanService {
  String baseUrl = 'http://localhost:8000/api';

  Future<bool> storePinjaman(String token, PinjamanModel funding) async {
    var url = Uri.parse('$baseUrl/pinjaman/store');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'users_id': funding.usersId,
        'nama': funding.nama,
        'deskripsi': funding.deskripsi,
        'alamat': funding.alamat,
        'plafond': funding.plafond,
        'terkumpul': funding.terkumpul,
        'bagi_hasil': funding.bagiHasil,
        'tenor': funding.tenor,
        'status': funding.status,
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
      throw Exception('Gagal Melakukan Request Funding!');
    }
  }
}
