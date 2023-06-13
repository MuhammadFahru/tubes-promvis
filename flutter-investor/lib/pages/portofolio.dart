import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
  PortofolioCubit() : super(_generateLendings());

  static List<PortofolioState> _generateLendings() {
    // Generate mock lendings
    return List.generate(
      10,
      (index) => PortofolioState(
        name: 'Lending $index',
        desc: 'Description $index',
        currentPayback: 500,
        targetPayback: 1000,
        currentDays: 15,
        targetDays: 30,
      ),
    );
  }
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
          title: Text(
            'Portofolio',
            style: GoogleFonts.inter(
                color: primaryTextColor, fontWeight: bold, fontSize: 16),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [SummaryModule(), ListModule()],
        ),
      ),
    );
  }
}

class SummaryModule extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Total Current Payment',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          BlocBuilder<PortofolioCubit, List<PortofolioState>>(
            builder: (context, lendings) {
              final totalPayment = lendings.fold<double>(
                0,
                (previousValue, lending) =>
                    previousValue + lending.currentPayback,
              );
              return Text(
                '\$${totalPayment.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ListModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortofolioCubit, List<PortofolioState>>(
      builder: (context, state) {
        return Expanded(
            child: ListView.builder(
          primary: true,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            final lending = state[index];
            return Card(
              child: ListTile(
                title: Text(lending.name),
                subtitle: Text(lending.desc),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        '${lending.currentPayback.toStringAsFixed(2)} / ${lending.currentPayback.toStringAsFixed(2)}'),
                    SizedBox(height: 4),
                    Text('${lending.currentDays} / ${lending.targetDays} days'),
                  ],
                ),
              ),
            );
          },
        ));
      },
    );
  }
}
