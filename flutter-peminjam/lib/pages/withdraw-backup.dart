import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_app/models/pinjaman_model.dart';
import 'package:flutter_app/services/pinjaman_service.dart';
import 'package:flutter_app/providers/wallet_provider.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:flutter_app/providers/auth_provider.dart';

class WithdrawBackUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pengisian Withdraw'),
      ),
      body: WithdrawBackUp(),
    );
  }
}

class WithdrawBackUp extends StatefulWidget {
  @override
  _withdrawBackUpState createState() => _withdrawBackUpState();
}

class _withdrawBackUpState extends State<WithdrawBackUp> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _namaController = TextEditingController();

  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _nominalController = TextEditingController();
  TextEditingController _bagiHasilController = TextEditingController();
  TextEditingController _tenorController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _nominalController.dispose();
    _bagiHasilController.dispose();
    _tenorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WalletProvider walletProvider = Provider.of<WalletProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleWithdraw() async {
      print("Debug");
      print(user.id!);
      print(_nominalController.text);
      if (await walletProvider.withdraw(
          user.id, double.parse(_nominalController.text))) {
        Navigator.pushNamed(context, '/index');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Withdraw!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFormField(
              //   controller: _namaController,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter the funding title';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'Judul Funding',
              //   ),
              // ),
              // TextFormField(
              //   controller: _deskripsiController,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter the funding title';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'Deskripsi Funding',
              //   ),
              // ),
              TextFormField(
                controller: _nominalController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the nominal amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nominal Dana Yang Ingin Ditarik',
                  prefixText: 'Rp',
                ),
              ),
              // TextFormField(
              //   controller: _bagiHasilController,
              //   keyboardType: TextInputType.numberWithOptions(decimal: true),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter the profit share';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'Persentasi Bagi Hasil',
              //     suffixText: '%',
              //   ),
              // ),
              // TextFormField(
              //   controller: _tenorController,
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter the tenor';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'Tenor Waktu',
              //     suffixText: 'Minggu',
              //   ),
              // ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  handleWithdraw();
                },
                child: Text('Withdraw'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final int thousandSeparatorLength = ','.length;
    final int textLength = newValue.text.length;
    int commaCounter = 0;
    String newText = '';

    for (int i = textLength - 1; i >= 0; i--) {
      final String character = newValue.text[i];

      if (character == ',') {
        commaCounter++;
        if (commaCounter % 4 == 0) {
          newText = '$character$newText';
        }
      } else {
        newText = '$character$newText';
      }
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length -
            ((textLength - newValue.selection.baseOffset) ~/
                thousandSeparatorLength),
      ),
    );
  }
}
