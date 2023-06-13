import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/forgot_password.dart';
import 'package:flutter_app/pages/password_sent.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/pages/topUp.dart';

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
          BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        ],
        child: MaterialApp(
          title: 'Prospera',
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/forgotPassword': (context) => ForgotPasswordPage(),
            '/signUp': (context) => Signup(),
            '/passwordSent': (context) => PasswordSentPage(),
            '/index': (context) => IndexPage(),
            '/topUp': (context) => TopUpPage(),
          },
        ));
  }
}
