class PinjamanModel {
  String? nama;
  String? deskripsi;
  String? alamat;
  double? plafond;
  double? terkumpul;
  double? bagiHasil;
  int? tenor;
  DateTime? deadline;
  String? status;

  PinjamanModel({
    required this.nama,
    required this.deskripsi,
    required this.alamat,
    required this.plafond,
    required this.terkumpul,
    required this.bagiHasil,
    required this.tenor,
    required this.deadline,
    required this.status,
  });

  factory PinjamanModel.fromJsonFactory(Map<String, dynamic> json) {
    return PinjamanModel(
        nama: json['nama'],
        deskripsi: json['deskripsi'],
        alamat: json['alamat'],
        plafond: json['plafond'],
        terkumpul: json['terkumpul'],
        bagiHasil: json['bagi_hasil'],
        tenor: json['tenor'],
        deadline: DateTime.parse(json['deadline']),
        status: json['status']);
  }

  PinjamanModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    alamat = json['alamat'];
    plafond = double.parse(json['plafond']);
    terkumpul = double.parse(json['terkumpul']);
    bagiHasil = double.parse(json['bagi_hasil']);
    tenor = int.parse(json['tenor']);
    deadline = DateTime.parse(json['deadline']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'deskripsi': deskripsi,
      'alamat': alamat,
      'plafond': plafond,
      'terkumpul': terkumpul,
      'bagi_hasil': bagiHasil,
      'tenor': tenor,
      'deadline': deadline.toString(),
      'status': status,
    };
  }
}
