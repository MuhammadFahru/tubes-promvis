class UserModel {
  int? id;
  String? nik;
  String? nama;
  String? email;
  String? noHandphone;
  String? bankNama;
  String? bankNoRekening;
  String? kategori;
  String? sektor;
  String? companyName;
  String? companyEmail;
  String? companyAddress;
  double? walletBalance;
  String? fotoUrl;
  String? token;

  UserModel({
    this.id = 0,
    this.nik = '',
    this.nama = '',
    this.email = '',
    this.noHandphone = '',
    this.bankNama = '',
    this.bankNoRekening = '',
    this.kategori = '',
    this.sektor = '',
    this.companyName = '',
    this.companyEmail = '',
    this.companyAddress = '',
    this.walletBalance = 0,
    this.fotoUrl = '',
    this.token = '',
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    email = json['email'];
    noHandphone = json['email'];
    bankNama = json['email'];
    bankNoRekening = json['email'];
    kategori = json['email'];
    sektor = json['email'];
    companyName = json['email'];
    companyEmail = json['email'];
    companyAddress = json['email'];
    walletBalance = 0;
    fotoUrl = json['foto'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nik': nik,
      'nama': nama,
      'email': email,
      'noHandphone': email,
      'bankNama': email,
      'bankNoRekening': email,
      'kategori': email,
      'sektor': email,
      'companyName': email,
      'companyEmail': email,
      'companyAddress': email,
      'walletBalance': 0,
      'foto': fotoUrl,
      'token': token,
    };
  }
}
