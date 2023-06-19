class AngsuranModel {
  double? jumlah;
  DateTime? tanggal;
  String? status;

  AngsuranModel({
    required this.jumlah,
    required this.tanggal,
    required this.status,
  });

  AngsuranModel.fromJson(Map<String, dynamic> json) {
    jumlah = json['jumlah'];
    tanggal = DateTime.parse(json['tanggal']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'jumlah': jumlah,
      'tanggal': tanggal.toString(),
      'status': status,
    };
  }
}
