import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            PasswordTextField(),
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
                  // Perform login action
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
    );
  }
}

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility(bool isVisisble) {
    setState(() {
      _isPasswordVisible = isVisisble;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse('0xffF6F6F6')),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: TextField(
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: 'Password',
            labelStyle: TextStyle(
                color: Color(int.parse('0xffBDBDBD')),
                fontWeight: FontWeight.bold),
            suffixIcon: GestureDetector(
              onTapDown: (_) => _togglePasswordVisibility(true),
              onTapUp: (_) => _togglePasswordVisibility(false),
              onTapCancel: () => _togglePasswordVisibility(false),
              child: IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {},
              ),
            )),
      ),
    );
  }
}
