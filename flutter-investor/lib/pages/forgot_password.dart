import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Forgot Password",
          style: GoogleFonts.inter(
              color: Colors.black, fontWeight: semiBold, fontSize: 24),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                'Enter your email and we’ll send you a link',
                style: GoogleFonts.inter(
                    color: Colors.black, fontSize: 12, fontWeight: regular),
              ),
            ),
            Center(
              child: Text(
                'to reset your password.',
                style: GoogleFonts.inter(
                    color: Colors.black, fontSize: 12, fontWeight: regular),
              ),
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
                    labelStyle: GoogleFonts.inter(
                        color: secondaryTextColor,
                        fontWeight: medium,
                        fontSize: 16)),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
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
                  child: Text(
                    'Send code',
                    style: GoogleFonts.inter(
                        color: primaryTextColor,
                        fontWeight: semiBold,
                        fontSize: 16),
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
