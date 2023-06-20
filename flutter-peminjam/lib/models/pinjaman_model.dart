class PinjamanModel {
  int? usersId;
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
    required this.usersId,
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
        usersId: json['users_id'],
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
    usersId:
    json['users_id'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    alamat = json['alamat'];
    plafond = json['plafond'];
    terkumpul = json['terkumpul'];
    bagiHasil = json['bagi_hasil'];
    tenor = json['tenor'];
    deadline = DateTime.parse(json['deadline']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'users_id': usersId,
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
