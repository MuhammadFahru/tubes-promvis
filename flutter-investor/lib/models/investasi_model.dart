class InvestasiModel {
  int? userId;
  int? pinjamanId;
  double? jumlah;

  InvestasiModel(
      {required this.userId, required this.pinjamanId, required this.jumlah});

  InvestasiModel.fromJson(Map<String, dynamic> json) {
    userId = json['users_id'];
    pinjamanId = json['pinjaman_id'];
    jumlah = json['jumlah'];
  }

  Map<String, dynamic> toJson() {
    return {
      'users_id': userId,
      'pinjaman_id': pinjamanId,
      'investasi': jumlah,
    };
  }
}
