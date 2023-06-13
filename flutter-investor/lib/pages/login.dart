import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'password_field.dart';
import 'signup.dart';

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

  bool performLogin(String email, String password) {
    final email = 'fakemail';
    final id = '1';
    final userData = {'email': email, 'age': 0};
    final newState = state.copyWith(
      email: email,
      id: id,
      userData: userData,
    );

    emit(newState);
    return true;
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
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Judul
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Log In',
                  style: GoogleFonts.inter(
                    fontSize: 30.0,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Email
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor6,
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
                          color: secondaryTextColor,
                          fontWeight: medium,
                          fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16.0),
              // Password
              Container(
                decoration: BoxDecoration(
                  color: Color(int.parse('0xffF6F6F6')),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: BlocBuilder<PasswordVisibilityCubit, bool>(
                    builder: (context, isPasswordVisible) {
                  return TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: secondaryTextColor,
                            fontWeight: medium,
                            fontSize: 16),
                        suffixIcon: GestureDetector(
                          onTapDown: (_) => context
                              .read<PasswordVisibilityCubit>()
                              .showPassword(),
                          onTapUp: (_) => context
                              .read<PasswordVisibilityCubit>()
                              .hidePassword(),
                          onTapCancel: () => context
                              .read<PasswordVisibilityCubit>()
                              .hidePassword(),
                          child: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {},
                          ),
                        )),
                  );
                }),
              ),
              const SizedBox(height: 8.0),
              // password forgot
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to forgot password page
                    Navigator.pushNamed(context, '/forgotPassword');
                  },
                  child: Text(
                    'Forgot your password?',
                    style: GoogleFonts.inter(
                        color: primaryColor,
                        fontSize: 16.0,
                        fontWeight: medium),
                  ),
                ),
              ),
              const Spacer(),
              // login button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    if (loginCubit.performLogin(email, password)) {
                      Navigator.pushNamed(context, '/index');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.inter(
                          color: primaryTextColor,
                          fontWeight: semiBold,
                          fontSize: 16),
                    ),
                  )),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Signup();
                      },
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.inter(
                      fontWeight: medium, color: primaryColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
