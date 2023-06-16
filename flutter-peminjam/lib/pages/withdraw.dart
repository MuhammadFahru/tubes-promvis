import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/cubit/wallet_cubit.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  WithdrawCubit() : super(WithdrawState());
  final formKey = GlobalKey<FormState>();
  final customNominalController = TextEditingController();

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

  void setTermAgree(bool val) {
    emit(state.copyWith(agreeTerm: val));
  }

  void topUp() {
    if (formKey.currentState!.validate()) {}
    // handle top-up logic with selected bank and nominal
  }
}

class WithdrawState {
  final int selectedNominal;
  final int customNominal;
  final String nominalFieldVal;
  final bool agreeTerm;

  WithdrawState(
      {this.selectedNominal = 0,
      this.customNominal = 0,
      this.nominalFieldVal = 'test',
      this.agreeTerm = false});

  WithdrawState copyWith(
      {List<String>? banks,
      String? selectedBank,
      int? selectedNominal,
      int? customNominal,
      String? nominalFieldVal,
      bool? agreeTerm}) {
    return WithdrawState(
        selectedNominal: selectedNominal ?? this.selectedNominal,
        customNominal: customNominal ?? this.customNominal,
        nominalFieldVal: nominalFieldVal ?? this.nominalFieldVal,
        agreeTerm: agreeTerm ?? this.agreeTerm);
  }
}

class WithdrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WithdrawCubit>(
          create: (context) => WithdrawCubit(),
        ),
        BlocProvider<WalletCubit>(create: (context) => WalletCubit())
      ],
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
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 32.0,
          ),
          _buildWalletValue(context),
          SizedBox(
            height: 32,
          ),
          _buildNominalForm(context),
          const Spacer(),
          _buildTermsCheckbox(context),
          SizedBox(
            height: 16.0,
          ),
          _buildWithdrawButton(
            context,
          )
          // nominal box
        ],
      ),
    );
  }

  Widget _buildWalletValue(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Limit Saldo',
            style: GoogleFonts.inter(
                fontWeight: regular, fontSize: 16, color: primaryTextColor),
          ),
          BlocBuilder<WalletCubit, int>(
            builder: (context, nominal) => Text(
              "Rp${nominal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')},00",
              style: GoogleFonts.inter(
                  fontWeight: bold, fontSize: 24, color: primaryTextColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNominalForm(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nominal Penarikkan',
            style: GoogleFonts.inter(
                fontSize: 14, fontWeight: regular, color: primaryTextColor),
          ),
          SizedBox(
            height: 16.0,
          ),
          _buildNominalCards(context),
          SizedBox(
            height: 32.0,
          ),
          _buildNominalField(context),
        ],
      ),
    );
  }

  Widget _buildNominalCards(BuildContext context) {
    return SizedBox(
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
          final isSelected = context.select(
              (WithdrawCubit cubit) => cubit.state.selectedNominal == nominal);

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
          } else if (!isCustomNominalEmpty && int.parse(value!) < 10000) {
            return 'Please enter a value higher than 100.00';
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
              hintText: "Minimal Rp10.000",
              hintStyle: GoogleFonts.inter(
                  fontWeight: medium, color: secondaryTextColor, fontSize: 16),
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

  Widget _buildTermsCheckbox(BuildContext context) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(builder: (context, state) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
                value: state.agreeTerm,
                onChanged: (value) =>
                    context.read<WithdrawCubit>().setTermAgree(value!)),
            Text(
              "Saya menyetujui syarat & ketentuan yang berlaku",
              style: GoogleFonts.inter(
                  color: primaryTextColor, fontSize: 12, fontWeight: regular),
            )
          ],
        ),
      );
    });
  }

  Widget _buildWithdrawButton(BuildContext context) {
    bool formIsValid() {
      if ((context.watch<WithdrawCubit>().state.selectedNominal != 0 ||
              context.watch<WithdrawCubit>().state.customNominal != 0) &&
          context.watch<WithdrawCubit>().state.agreeTerm == true) {
        return true;
      } else {
        return false;
      }
    }

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
        onPressed:
            formIsValid() ? () => context.read<WithdrawCubit>().topUp() : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Finalize',
            style: GoogleFonts.inter(
                color: formIsValid() ? Colors.white : Colors.grey[500],
                fontWeight: semiBold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
