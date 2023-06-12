import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'payment_detail.dart';

class PaymentFundingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bayar Angsuran'),
        ),
        body: PaymentFunding());
  }
}

class PaymentFunding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 00),
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(int.parse('0xff613EEA')),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text("Biaya Angsuran",
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white))),
                            Container(
                                child: Text("Rp1.000.000",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: ComboBoxBank(),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentDetailPage(),
                  ),
                );
              },
              child: Text('LANJUTKAN'),
            ),
          )
        ],
      ),
    );
  }
}

List<String> listBank = [
  "Bank Central Asia",
  "Bank Mandiri",
  "Bank Jago",
  "United Overseas Bank",
  "BCA Syariah",
  "Bank Negara Indonesia",
  "Bank Permata",
  "Bank Syariah Indonesia",
  "Bank Rakyat Indonesia",
  "Bank BJB"
];

class ComboBoxBank extends StatefulWidget {
  const ComboBoxBank({super.key});

  @override
  State<ComboBoxBank> createState() => _ComboBoxBankState();
}

class _ComboBoxBankState extends State<ComboBoxBank> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DropdownButton<String>(
        hint: Text("- Pilih Bank- "),
        value: dropdownValue,
        elevation: 16,
        underline: Container(color: Colors.transparent),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: listBank.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
