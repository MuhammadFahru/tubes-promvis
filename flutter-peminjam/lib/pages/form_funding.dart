import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';

class FormFundingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Pengajuan Funding'),
        ),
        body: FormFunding());
  }
}

class FormFunding extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _nominalController = TextEditingController();
  TextEditingController _bagiHasilController = TextEditingController();
  TextEditingController _tenorController = TextEditingController();

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

                    String message =
                        'Nominal: $nominal\nProfit Share: $bagiHasil\nTenor: $tenor';

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
