import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/pinjaman_model.dart';

class PinjamanService {
  final String baseUrl = "http://localhost:8000/api";

  Future<List<PinjamanModel>> fetchPinjaman(int id) async {
    final url = Uri.parse("$baseUrl/pinjaman/getData");
    final headers = {'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);
    print("fungsi terpanggil");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Debug nama");
      print(data['data'][0]['nama'].runtimeType);
      print("Debug deskripsi");
      print(data['data'][0]['deskripsi'].runtimeType);
      print("Debug alamat");
      print(data['data'][0]['alamat'].runtimeType);
      print("Debug plafond");
      print(data['data'][0]['plafond'].runtimeType);
      print("Debug terkumpul");
      print(data['data'][0]['terkumpul'].runtimeType);
      print("Debug bagi_hasil");
      print(data['data'][0]['bagi_hasil'].runtimeType);
      print("Debug tenor");
      print(data['data'][0]['tenor'].runtimeType);
      print("Debug deadline");
      print(data['data'][0]['deadline'].runtimeType);
      print("Debug status");
      print(data['data'][0]['status'].runtimeType);
      return data['data']
          .map<PinjamanModel>((item) => PinjamanModel.fromJsonFactory(item))
          .toList();
    } else {
      throw Exception('Failed to fetch funding data');
    }
  }
}
