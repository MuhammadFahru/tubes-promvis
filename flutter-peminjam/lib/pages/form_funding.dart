import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_app/models/pinjaman_model.dart';
import 'package:flutter_app/services/pinjaman_service.dart';
import 'package:flutter_app/providers/pinjaman_provider.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:flutter_app/providers/auth_provider.dart';

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
    PinjamanProvider pinjamanProvider = Provider.of<PinjamanProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handlePinjaman() async {
      // print("Debug");
      // print(user.id!);
      PinjamanModel funding = PinjamanModel(
          usersId: user.id!,
          nama: _namaController.text,
          deskripsi: _deskripsiController.text,
          plafond: double.parse(_nominalController.text),
          bagiHasil: double.parse(_bagiHasilController.text),
          tenor: int.parse(_tenorController.text),
          alamat: "Test Alamat",
          terkumpul: 0,
          deadline: null,
          status: "Pengajuan");

      if (await pinjamanProvider.storePinjaman(user.token!, funding)) {
        Navigator.pushNamed(context, '/index');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Register!',
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
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the funding title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Judul Funding',
                ),
              ),
              TextFormField(
                controller: _deskripsiController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the funding title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Deskripsi Funding',
                ),
              ),
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
                    String plafond = _nominalController.text;
                    String bagi_hasil = _bagiHasilController.text;
                    String tenor = _tenorController.text;
                    String nama = _namaController.text;
                    String deskripsi = _deskripsiController.text;

                    double totalTagihan = int.parse(plafond) +
                        (double.parse(bagi_hasil) * int.parse(plafond) / 100);
                    ;
                    double cicilan = totalTagihan / int.parse(tenor);
                    String message =
                        'Nama: $nama\nDeskripsi: Rp$deskripsi\nNominal: Rp$plafond\nProfit Share: $bagi_hasil%\nTenor: $tenor Minggu\n====\nTotal Tagihan: $totalTagihan\nCicilan Mingguan: $cicilan';

                    handlePinjaman();
                    // _showSnackBar(context, message);
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
