import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';
import 'forgot_password.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<LoginCubit>(create: (_) => LoginCubit())],
        child: MaterialApp(
          title: 'Prospera',
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/forgotPassword': (context) => ForgotPasswordPage(),
            '/home': (context) => HomePage(),
            // '/signUp': (context) => Signup(),
          },
        ));
  }
}
