import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/providers/auth_provider.dart';

import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/forgot_password.dart';
import 'package:flutter_app/pages/password_sent.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/pages/topUp.dart';
import 'package:flutter_app/pages/sign_in.dart';
import 'package:flutter_app/pages/sign_up.dart';
import 'package:flutter_app/pages/withdraw.dart';

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
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Prospera',
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          initialRoute: '/',
          routes: {
            '/': (context) => SignInPage(),
            '/forgotPassword': (context) => ForgotPasswordPage(),
            '/signUp': (context) => Signup(),
            '/passwordSent': (context) => PasswordSentPage(),
            '/index': (context) => IndexPage(),
            '/topUp': (context) => TopUpPage(),
            '/withdraw': (context) => WithdrawPage(),
            '/sign-in': (context) => SignInPage(),
            '/sign-up': (context) => SignUpPage(),
          },
        ));
  }
}
