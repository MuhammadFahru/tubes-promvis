import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/user_model.dart';

class AuthService {
  String baseUrl = 'http://localhost:8000/api';

  Future<UserModel> register({
    String? email,
    String? password,
    String? pin,
    String? nik,
    String? nama,
    String? noHandphone,
    int? bankId,
    String? bankNoRekening,
    int? kategoriId,
    int? sektorId,
    String? companyName,
    String? companyEmail,
    String? companyAddress,
  }) async {
    var url = Uri.parse('$baseUrl/register-peminjam');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
      'pin': pin,
      'nik': nik,
      'nama': nama,
      'no_handphone': noHandphone,
      'bank_id': bankId,
      'no_rekening': bankNoRekening,
      'kategori_umkm_id': kategoriId,
      'sektor_umkm_id': sektorId,
      'company_name': companyName,
      'company_email': companyEmail,
      'company_address': companyAddress,
    });

    print(body);

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      user.walletBalance = double.parse(data['wallet']['balance']);
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      user.walletBalance = double.parse(data['wallet']['balance']);
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
