class UserModel {
  int? id;
  String? nik;
  String? nama;
  String? email;
  String? noHandphone;
  String? bankNama;
  String? bankNoRekening;
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
    this.walletBalance = 0,
    this.fotoUrl = '',
    this.token = '',
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    email = json['email'];
    noHandphone = json['no_handphone'];
    bankNama = json['bank_nama'];
    bankNoRekening = json['no_rekening'];
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
      'no_handphone': noHandphone,
      'bank_nama': bankNama,
      'no_rekening': bankNoRekening,
      'walletBalance': 0,
      'foto': fotoUrl,
      'token': token,
    };
  }
}
