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
  final int cicilan = 1000000;
  final int saldo = 5000000;
  final ValueNotifier<bool> _isOnTapNotifier = ValueNotifier(false);
  final ValueNotifier<int> _groupValueNotifier = ValueNotifier(0);
  final ValueNotifier<String?> _selectedBankNotifier = ValueNotifier(null);

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
                              child: Text(
                                "Biaya Angsuran",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Rp${cicilan.toString()}",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 10),
                child: Text(
                  "Metode Pembayaran",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(height: 50),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(
                        Icons.attach_money,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Saldo Wallet",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Rp" + saldo.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 80, 80, 80),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _isOnTapNotifier.value = !_isOnTapNotifier.value;
                        _groupValueNotifier.value =
                            _isOnTapNotifier.value ? 1 : 0;
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ValueListenableBuilder<int>(
                          valueListenable: _groupValueNotifier,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: 1.3,
                              child: Radio(
                                value: 1,
                                groupValue: value,
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: (newValue) {
                                  _isOnTapNotifier.value = newValue == 1;
                                  _groupValueNotifier.value = newValue!;
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                child: Text(
                  "Atau",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
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
            child: ValueListenableBuilder<int>(
              valueListenable: _groupValueNotifier,
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: value != 0
                      ? () {
                          // Respond to button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentDetailPage(),
                            ),
                          );
                        }
                      : null,
                  child: Text('LANJUTKAN'),
                );
              },
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
