class InvestasiModel {
  double? investasi;

  InvestasiModel({required this.investasi});

  InvestasiModel.fromJson(Map<String, dynamic> json) {
    investasi = json['investasi'];
  }

  Map<String, dynamic> toJson() {
    return {
      'investasi': investasi,
    };
  }
}
