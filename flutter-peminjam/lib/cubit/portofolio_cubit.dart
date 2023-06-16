import 'package:flutter_bloc/flutter_bloc.dart';

class PortofolioItem {
  final String name;
  final String desc;
  final String address;
  final String imgPath;
  final int target;
  final int terkumpul;
  final DateTime mulai;
  final DateTime deadline;

  PortofolioItem({
    required this.name,
    required this.desc,
    required this.address,
    required this.imgPath,
    required this.target,
    required this.terkumpul,
    required this.mulai,
    required this.deadline,
  });

  PortofolioItem copyWith(
      String? name,
      String? desc,
      String? imgPath,
      String? address,
      int? target,
      int? terkumpul,
      DateTime? mulai,
      DateTime? deadline) {
    return PortofolioItem(
        name: name ?? this.name,
        desc: desc ?? this.desc,
        address: address ?? this.address,
        imgPath: imgPath ?? this.imgPath,
        target: target ?? this.target,
        terkumpul: terkumpul ?? this.terkumpul,
        mulai: mulai ?? this.mulai,
        deadline: deadline ?? this.deadline);
  }
}

class PortofolioCubit extends Cubit<List<PortofolioItem>> {
  PortofolioCubit() : super(_generateLendings());

  static List<PortofolioItem> _generateLendings() {
    // Generate mock lendings
    return List.generate(
          3,
          (index) => PortofolioItem(
            name: "Portofolio $index",
            desc: "Deskripsi $index",
            address: "Alamat $index",
            imgPath: '',
            target: 500,
            terkumpul: 200,
            mulai: DateTime(2023, 5, 30),
            deadline: DateTime(2024, 6, 15),
          ),
        ) +
        List.generate(
            3,
            (index) => PortofolioItem(
                  name: "Portofolio $index",
                  desc: "Deskripsi $index",
                  address: "Alamat $index",
                  imgPath: '',
                  target: 500,
                  terkumpul: 200,
                  mulai: DateTime(2023, 3, 30),
                  deadline: DateTime(2023, 12, 15),
                ));
  }
}
