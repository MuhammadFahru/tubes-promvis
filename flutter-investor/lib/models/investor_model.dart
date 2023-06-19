class InvestorModel {
  String? nik;
  String? nama;
  String? email;
  String? noHandphone;
  String? roles;
  String? foto;
  String? bank;
  String? noRekening;

  InvestorModel({
    required this.nik,
    required this.nama,
    required this.email,
    required this.noHandphone,
    required this.roles,
    required this.foto,
    required this.bank,
    required this.noRekening,
  });

  InvestorModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    email = json['email'];
    noHandphone = json['no_handphone'];
    roles = json['roles'];
    foto = json['foto'];
    bank = json['bank'];
    noRekening = json['no_rekening'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nik': nik,
      'nama': nama,
      'email': email,
      'no_handphone': noHandphone,
      'roles': roles,
      'foto': foto,
      'bank': bank,
      'no_rekening': noRekening,
    };
  }
}
