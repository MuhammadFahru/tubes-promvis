import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpCubit extends Cubit<TopUpState> {
  TopUpCubit() : super(TopUpState(banks: ['Bank A', 'Bank B', 'Bank C']));
  final formKey = GlobalKey<FormState>();
  final customNominalController = TextEditingController();

  void selectBank(String bank) {
    emit(state.copyWith(selectedBank: bank));
  }

  void selectNominal(int nominal) {
    customNominalController.clear();
    emit(state.copyWith(
        selectedNominal: nominal, customNominal: 0, nominalFieldVal: ''));
  }

  void customNominal(String string) {
    int customNominal = 0;
    if (string.isNotEmpty) {
      customNominal = int.parse(string);
    }
    emit(state.copyWith(
        selectedNominal: 0,
        customNominal: customNominal,
        nominalFieldVal: string));
  }

  void clearCustomnominal() {
    emit(state.copyWith(customNominal: 0, nominalFieldVal: ''));
  }

  void topUp() {
    if (formKey.currentState!.validate()) {}
    // handle top-up logic with selected bank and nominal
  }
}

class TopUpState {
  final List<String> banks;
  final String selectedBank;
  final int selectedNominal;
  final int customNominal;
  final String nominalFieldVal;

  TopUpState(
      {required this.banks,
      this.selectedBank = '',
      this.selectedNominal = 0,
      this.customNominal = 0,
      this.nominalFieldVal = 'test'});

  TopUpState copyWith({
    List<String>? banks,
    String? selectedBank,
    int? selectedNominal,
    int? customNominal,
    String? nominalFieldVal,
  }) {
    return TopUpState(
      banks: banks ?? this.banks,
      selectedBank: selectedBank ?? this.selectedBank,
      selectedNominal: selectedNominal ?? this.selectedNominal,
      customNominal: customNominal ?? this.customNominal,
      nominalFieldVal: nominalFieldVal ?? this.nominalFieldVal,
    );
  }
}

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopUpCubit>(
      create: (context) => TopUpCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Top Up'),
          ),
          body: TopUpForm()),
    );
  }
}

class TopUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  if (context.watch<TopUpCubit>().state.selectedBank.isEmpty)
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
          // nominal box
          Row(
            children: [
              Expanded(
                child: BlocBuilder<TopUpCubit, TopUpState>(
                  builder: (context, state) {
                    final nominals = [
                      5000,
                      10000,
                      25000,
                      50000,
                      100000,
                      150000
                    ];
                    return GridView.count(
                      crossAxisCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 2.5,
                      children: nominals.map((nominal) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(
                              color: state.selectedNominal == nominal
                                  ? Colors.purple
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              final cubit = context.read<TopUpCubit>();
                              if (state.selectedNominal == nominal) {
                                cubit.selectNominal(0);
                              } else {
                                cubit.selectNominal(nominal);
                              }
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Rp${nominal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                    style: TextStyle(
                                      color: state.selectedNominal == nominal
                                          ? Colors.purple
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                state.selectedNominal == nominal
                                    ? Container(
                                        width: 24,
                                        height: 24,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<TopUpCubit, TopUpState>(builder: (context, state) {
            return TextFormField(
              controller: context.read<TopUpCubit>().customNominalController,
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    state.selectedNominal == 0) {
                  return 'Please enter a nominal value';
                } else if (value != null &&
                    value.isNotEmpty &&
                    int.parse(value) <= 0) {
                  return 'Please enter a value higher than 0';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                context.read<TopUpCubit>().customNominal(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Nominal',
              ),
            );
          }),
          const Spacer(),
          ElevatedButton(
            onPressed: (context.watch<TopUpCubit>().state.selectedNominal !=
                            0 ||
                        context.watch<TopUpCubit>().state.customNominal != 0) &&
                    context.watch<TopUpCubit>().state.selectedBank != ''
                ? () => context.read<TopUpCubit>().topUp()
                : null,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
