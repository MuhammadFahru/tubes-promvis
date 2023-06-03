import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpCubit extends Cubit<TopUpState> {
  TopUpCubit() : super(TopUpState(banks: ['Bank A', 'Bank B', 'Bank C']));
  final formKey = GlobalKey<FormState>();

  void selectBank(String bank) {
    emit(state.copyWith(selectedBank: bank));
  }

  void toggleNominal(int nominal) {
    emit(state.copyWith(
        selectedNominal: state.selectedNominal == nominal ? 0 : nominal));
  }

  void selectNominal(int nominal) {
    emit(state.copyWith(selectedNominal: nominal, customNominal: 0));
  }

  void clearCustomnominal() {
    emit(state.copyWith(customNominal: 0));
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

  TopUpState({
    required this.banks,
    this.selectedBank = '',
    this.selectedNominal = 0,
    this.customNominal = 0,
  });

  TopUpState copyWith({
    List<String>? banks,
    String? selectedBank,
    int? selectedNominal,
    int? customNominal,
  }) {
    return TopUpState(
      banks: banks ?? this.banks,
      selectedBank: selectedBank ?? this.selectedBank,
      selectedNominal: selectedNominal ?? this.selectedNominal,
      customNominal: customNominal ?? this.customNominal,
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
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: state.banks.length,
                      itemBuilder: (context, index) {
                        final nominal = (index + 1) * 1000;
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
                                cubit.clearCustomnominal();
                              }
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$nominal',
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
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<TopUpCubit, TopUpState>(builder: (context, state) {
            return TextFormField(
              initialValue: state.customNominal > 0
                  ? state.customNominal.toStringAsFixed(0)
                  : '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a nominal value';
                } else if (int.parse(value) == 0) {
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
                var val;
                (value == '') ? (val = 0) : (val = value);
                context.read<TopUpCubit>().selectNominal(int.parse(val));
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Nominal',
              ),
            );
          }),
          const Spacer(),
          ElevatedButton(
            onPressed: context.watch<TopUpCubit>().state.selectedNominal != 0
                ? () => context.read<TopUpCubit>().topUp()
                : null,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
