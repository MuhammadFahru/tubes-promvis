import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/providers/wallet_provider.dart';
import 'package:flutter_app/providers/pinjaman_provider.dart';

import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/sign_in.dart';
import 'package:flutter_app/pages/sign_up.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/forgot_password.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/pages/password_sent.dart';
import 'package:flutter_app/pages/top_up.dart';
import 'package:flutter_app/pages/topUp-backup.dart';

import 'package:flutter_app/pages/withdraw.dart';
import 'package:flutter_app/pages/withdraw-backup.dart';

import 'package:flutter_app/pages/history_wallet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PinjamanProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => WalletProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prospera',
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          initialRoute: '/',
          routes: {
            '/': (context) => SignInPage(),
            '/sign-in': (context) => SignInPage(),
            '/sign-up': (context) => SignUpPage(),
            '/forgotPassword': (context) => ForgotPasswordPage(),
            '/signUp': (context) => Signup(),
            '/passwordSent': (context) => PasswordSentPage(),
            '/index': (context) => IndexPage(),
            '/top-up': (context) => TopUpPage(),
            '/top-up-b': (context) => TopUpBackUpPage(),
            '/withdraw': (context) => WithdrawPage(),
            '/withdraw-b': (context) => WithdrawBackUpPage(),
            '/history-wallet': (context) => HistoryPage(),
          },
        ));
  }
}
