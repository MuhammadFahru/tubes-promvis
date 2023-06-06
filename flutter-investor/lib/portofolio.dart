import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/**
 * silahkan modif sesuai API
 */
class PortofolioState {
  final String name;
  final String desc;
  final int currentPayback;
  final int targetPayback;
  final int currentDays;
  final int targetDays;

  PortofolioState({
    required this.name,
    required this.desc,
    required this.currentPayback,
    required this.targetPayback,
    required this.currentDays,
    this.targetDays = 50,
  });

  PortofolioState copyWith({
    String? name,
    String? desc,
    int? currentPayback,
    int? targetPayback,
    int? currentDays,
    int? targetDays,
  }) {
    return PortofolioState(
        name: name ?? this.name,
        desc: desc ?? this.desc,
        currentPayback: currentPayback ?? this.currentPayback,
        targetPayback: targetPayback ?? this.targetPayback,
        currentDays: currentDays ?? this.currentDays,
        targetDays: targetDays ?? this.targetDays);
  }
}

class PortofolioCubit extends Cubit<List<PortofolioState>> {
  PortofolioCubit() : super([]);
}

class PortofolioScreen extends StatelessWidget {
  const PortofolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortofolioCubit>(
      create: (context) => PortofolioCubit(),
      child: Scaffold(
        backgroundColor: Color(int.parse('0xffDBDBDB')),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Portofolio',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}
