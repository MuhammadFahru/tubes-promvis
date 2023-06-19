class PeminjamModel {
  String? nik;
  String? nama;
  String? email;
  String? noHandphone;
  String? roles;
  String? foto;
  String? bank;
  String? noRekening;
  String? kategoriUmkm;
  String? sektorUmkm;
  String? companyName;
  String? companyEmail;
  String? companyAddress;

  PeminjamModel({
    required this.nik,
    required this.nama,
    required this.email,
    required this.noHandphone,
    required this.roles,
    required this.foto,
    required this.bank,
    required this.noRekening,
    required this.kategoriUmkm,
    required this.sektorUmkm,
    required this.companyName,
    required this.companyEmail,
    required this.companyAddress,
  });

  PeminjamModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    email = json['email'];
    noHandphone = json['no_handphone'];
    roles = json['roles'];
    foto = json['foto'];
    bank = json['bank'];
    noRekening = json['no_rekening'];
    kategoriUmkm = json['kategori_umkm'];
    sektorUmkm = json['sektor_umkm'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyAddress = json['company_address'];
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
      'kategori_umkm': kategoriUmkm,
      'sektor_umkm': sektorUmkm,
      'company_name': companyName,
      'company_email': companyEmail,
      'company_address': companyAddress,
    };
  }
}
