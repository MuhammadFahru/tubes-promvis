import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  SharedPreferences? _prefs;

  AuthProvider() {
    initializeSharedPreferences();
  }

  UserModel get user => _user ?? UserModel();

  set user(UserModel user) {
    _user = user;
    saveUserToSharedPreferences(user);
    notifyListeners();
  }

  Future<void> initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    String? userJson = _prefs!.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      UserModel user = UserModel.fromJson(userMap);
      _user = user;
    }
  }

  Future<void> saveUserToSharedPreferences(UserModel user) async {
    _prefs ??= await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = user.toJson();
    String userJson = jsonEncode(userMap);
    await _prefs!.setString('user', userJson);
    print(_prefs!.getString('user'));
  }

  Future<bool> register({
    String? email,
    String? password,
    String? pin,
    String? nik,
    String? nama,
    String? noHandphone,
    int? bankId,
    String? bankNoRekening,
  }) async {
    try {
      UserModel user = await AuthService().register(
        email: email ?? '',
        password: password ?? '',
        pin: pin ?? '',
        nik: nik ?? '',
        nama: nama ?? '',
        noHandphone: noHandphone ?? '',
        bankId: bankId ?? 0,
        bankNoRekening: bankNoRekening ?? '',
      );

      _user = user;
      saveUserToSharedPreferences(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email ?? '',
        password: password ?? '',
      );
      _user = user;
      saveUserToSharedPreferences(user);
      print(_user?.nama);
      print("Login Berhasil");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
