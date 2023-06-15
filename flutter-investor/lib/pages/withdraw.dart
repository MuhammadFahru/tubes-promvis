import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  WithdrawCubit() : super(WithdrawState());
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

class WithdrawState {
  final String selectedBank;
  final int selectedNominal;
  final int customNominal;
  final String nominalFieldVal;

  WithdrawState(
      {this.selectedBank = '',
      this.selectedNominal = 0,
      this.customNominal = 0,
      this.nominalFieldVal = 'test'});

  WithdrawState copyWith({
    List<String>? banks,
    String? selectedBank,
    int? selectedNominal,
    int? customNominal,
    String? nominalFieldVal,
  }) {
    return WithdrawState(
      selectedBank: selectedBank ?? this.selectedBank,
      selectedNominal: selectedNominal ?? this.selectedNominal,
      customNominal: customNominal ?? this.customNominal,
      nominalFieldVal: nominalFieldVal ?? this.nominalFieldVal,
    );
  }
}

class WithdrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WithdrawCubit>(
      create: (context) => WithdrawCubit(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 80,
            title: Text(
              'Top Up',
              style: GoogleFonts.inter(
                  fontWeight: semiBold, fontSize: 30, color: Colors.black),
            ),
          ),
          body: WithdrawForm()),
    );
  }
}

class WithdrawForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 32.0,
          ),
          // nominal box
          _buildNominalCards(context),
          SizedBox(
            height: 64.0,
          ),
          // nominal manual
          _buildNominalField(context),
          const Spacer(),
          _buildTopUpButton(
            context,
          )
        ],
      ),
    );
  }

  Widget _buildNominalCards(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Pilih nominal:',
                style: GoogleFonts.inter(
                    color: Colors.black, fontSize: 14, fontWeight: semiBold),
              ),
            ),
          ),
          SizedBox(
            child: GridView.count(
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              childAspectRatio: 2.0,
              children: [
                10000,
                20000,
                50000,
                100000,
                250000,
                500000,
              ].map((nominal) {
                final isSelected = context.select((WithdrawCubit cubit) =>
                    cubit.state.selectedNominal == nominal);

                return GestureDetector(
                  onTap: () {
                    final cubit = context.read<WithdrawCubit>();
                    if (isSelected) {
                      cubit.selectNominal(0);
                    } else {
                      cubit.selectNominal(nominal);
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: isSelected ? primaryColor : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Rp${nominal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                            style: GoogleFonts.inter(
                                color: isSelected ? primaryColor : Colors.grey,
                                fontWeight: medium,
                                fontSize: 16),
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNominalField(BuildContext context) {
    final cubit = context.read<WithdrawCubit>();
    final customNominalController = cubit.customNominalController;

    return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        final selectedNominal = state.selectedNominal;
        final isCustomNominalEmpty = customNominalController.text.isEmpty;

        String? validateNominal(String? value) {
          if (isCustomNominalEmpty && selectedNominal == 0) {
            return 'Please enter a nominal value';
          } else if (!isCustomNominalEmpty && int.parse(value!) <= 0) {
            return 'Please enter a value higher than 0';
          }
          return null;
        }

        return Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16.0)),
          child: TextFormField(
            controller: customNominalController,
            validator: validateNominal,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            onChanged: cubit.customNominal,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: backgroundColor6,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.add_box,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Input Manual',
                    style: GoogleFonts.inter(
                        color: secondaryTextColor,
                        fontSize: 16,
                        fontWeight: medium),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopUpButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: (context.watch<WithdrawCubit>().state.selectedNominal != 0 ||
                    context.watch<WithdrawCubit>().state.customNominal != 0) &&
                context.watch<WithdrawCubit>().state.selectedBank != ''
            ? () => context.read<WithdrawCubit>().topUp()
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Finalize',
            style: GoogleFonts.inter(
                color: (context.watch<WithdrawCubit>().state.selectedNominal !=
                                0 ||
                            context
                                    .watch<WithdrawCubit>()
                                    .state
                                    .customNominal !=
                                0) &&
                        context.watch<WithdrawCubit>().state.selectedBank != ''
                    ? Colors.white
                    : Colors.grey[500],
                fontWeight: semiBold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
