import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'password_field.dart';

class LoginState extends Equatable {
  final String email;
  final String id;
  final Map<String, dynamic> userData;

  const LoginState(
      {required this.email, required this.id, required this.userData});

  LoginState copyWith({
    String? email,
    String? id,
    Map<String, dynamic>? userData,
  }) {
    return LoginState(
        email: email ?? this.email,
        id: id ?? this.id,
        userData: userData ?? this.userData);
  }

  @override
  List<Object?> get props => [email, id, userData];
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(email: '', id: '', userData: {}));

  void performLogin(String email, String password) {
    final email = 'fakemail';
    final id = '1';
    final userData = {'email': email, 'age': 0};
    final newState = state.copyWith(
      email: email,
      id: id,
      userData: userData,
    );

    emit(newState);
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocProvider(
      create: (_) => PasswordVisibilityCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Judul
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Email
              Container(
                decoration: BoxDecoration(
                  color: Color(int.parse('0xffF6F6F6')),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Color(int.parse('0xffBDBDBD')),
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 16.0),
              // Password
              const PasswordTextField(),
              const SizedBox(height: 8.0),
              // password forgot
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to forgot password page
                  },
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: Color(int.parse('0xff613EEA')),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // login button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(int.parse('0xff613EEA')),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    loginCubit.performLogin(email, password);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Navigate to sign-up page
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse('0xff613EEA'))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
