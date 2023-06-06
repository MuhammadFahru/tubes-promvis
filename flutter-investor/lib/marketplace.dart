import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
///Modif sesuai api
///
class MarketplaceItems {}

class MarketplaceCubit extends Cubit<List<MarketplaceItems>> {
  MarketplaceCubit() : super([]);
}

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarketplaceCubit>(
      create: (context) => MarketplaceCubit(),
      child: Scaffold(
        backgroundColor: Color(int.parse('0xffDBDBDB')),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Funding Marketplace',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}
