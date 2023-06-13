import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 95,
                ),
                const Center(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                'Enter your email and we’ll send you a link',
              ),
            ),
            const Center(
              child: Text('to reset your password.'),
            ),
            const SizedBox(height: 16.0),
            // email field
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
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(int.parse('0xff613EEA')),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  final email = emailController.text;
                  if (EmailValidator.validate(email)) {
                    Navigator.pushNamed(context, '/passwordSent',
                        arguments: email);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid email')),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Send code',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
