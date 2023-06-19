import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FormFundingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pengajuan Funding'),
      ),
      body: FormFunding(),
    );
  }
}

class FormFunding extends StatefulWidget {
  @override
  _FormFundingState createState() => _FormFundingState();
}

class _FormFundingState extends State<FormFunding> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _nominalController = TextEditingController();
  TextEditingController _bagiHasilController = TextEditingController();
  TextEditingController _tenorController = TextEditingController();

  @override
  void dispose() {
    _nominalController.dispose();
    _bagiHasilController.dispose();
    _tenorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nominalController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  ThousandsSeparatorInputFormatter(),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the nominal amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nominal Dana Yang Dibutuhkan',
                  prefixText: 'Rp',
                ),
              ),
              TextFormField(
                controller: _bagiHasilController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the profit share';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Persentasi Bagi Hasil',
                  suffixText: '%',
                ),
              ),
              TextFormField(
                controller: _tenorController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the tenor';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Tenor Waktu',
                  suffixText: 'Minggu',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String nominal = _nominalController.text;
                    String bagiHasil = _bagiHasilController.text;
                    String tenor = _tenorController.text;

                    double totalTagihan = int.parse(nominal) +
                        (double.parse(bagiHasil) * int.parse(nominal) / 100);
                    ;
                    double cicilan = totalTagihan / int.parse(tenor);
                    String message =
                        'Nominal: Rp$nominal\nProfit Share: $bagiHasil%\nTenor: $tenor Minggu\n====\nTotal Tagihan: $totalTagihan\nCicilan Mingguan: $cicilan';

                    _showSnackBar(context, message);
                  }
                },
                child: Text('Submit'),
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
