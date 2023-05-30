import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpCubit extends Cubit<TopUpState> {
  TopUpCubit() : super(TopUpState(banks: ['Bank A', 'Bank B', 'Bank C']));

  void selectBank(String bank) {
    emit(state.copyWith(selectedBank: bank));
  }

  void toggleNominal(int nominal) {
    emit(state.copyWith(
        selectedNominal: state.selectedNominal == nominal ? 0 : nominal));
  }

  void selectNominal(int nominal) {
    emit(state.copyWith(selectedNominal: nominal));
  }

  void enterNominal(int nominal) {
    emit(state.copyWith(enteredNominal: nominal));
  }

  void topUp() {
    // handle top-up logic with selected bank and nominal
  }
}

class TopUpState {
  final List<String> banks;
  final String selectedBank;
  final int selectedNominal;
  final int enteredNominal;

  TopUpState({
    required this.banks,
    this.selectedBank = '',
    this.selectedNominal = 0,
    this.enteredNominal = 0,
  });

  TopUpState copyWith({
    List<String>? banks,
    String? selectedBank,
    int? selectedNominal,
    int? enteredNominal,
  }) {
    return TopUpState(
      banks: banks ?? this.banks,
      selectedBank: selectedBank ?? this.selectedBank,
      selectedNominal: selectedNominal ?? this.selectedNominal,
      enteredNominal: enteredNominal ?? this.enteredNominal,
    );
  }
}

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Pilih bank:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                    child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: context.watch<TopUpCubit>().state.selectedBank,
                    onChanged: (value) =>
                        context.read<TopUpCubit>().selectBank(value!),
                    items: [
                      if (context
                          .watch<TopUpCubit>()
                          .state
                          .selectedBank
                          .isEmpty)
                        const DropdownMenuItem(
                          value: '',
                          child: Text('Pick a bank'),
                        ),
                      ...context
                          .watch<TopUpCubit>()
                          .state
                          .banks
                          .map((bank) => DropdownMenuItem(
                                value: bank,
                                child: Text(bank),
                              ))
                          .toList(),
                    ],
                  ),
                )),
              ),
              const SizedBox(height: 50.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Pilih nominal:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [10, 20, 50, 100, 200, 500]
                    .map((nominal) => Card(
                          color: context
                                      .watch<TopUpCubit>()
                                      .state
                                      .selectedNominal ==
                                  nominal
                              ? Colors.blue
                              : null,
                          child: InkWell(
                            onTap: () => context
                                .read<TopUpCubit>()
                                .toggleNominal(nominal),
                            child: Center(child: Text('Rp$nominal,00')),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    context.read<TopUpCubit>().enterNominal(int.parse(value)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Nominal',
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed:
                    context.watch<TopUpCubit>().state.selectedNominal != 0
                        ? () => context.read<TopUpCubit>().topUp()
                        : null,
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
