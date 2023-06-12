import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup.dart';
import 'login.dart';
import 'forgot_password.dart';
import 'index.dart';
import 'password_sent.dart';

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
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/forgotPassword': (context) => ForgotPasswordPage(),
            '/signUp': (context) => Signup(),
            '/passwordSent': (context) => PasswordSentPage(),
            '/index': (context) => IndexPage(),
          },
        ));
  }
}
