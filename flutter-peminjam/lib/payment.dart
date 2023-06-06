import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PaymentFundingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bayar Angsuran'),
        ),
        body: PaymentFundihg());
  }
}

class PaymentFundihg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Ini nanti bayar di sini yaa"));
  }
}
