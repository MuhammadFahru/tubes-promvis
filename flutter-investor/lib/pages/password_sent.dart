import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordSentPage extends StatelessWidget {
  const PasswordSentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Email Sent',
                style: GoogleFonts.inter(fontSize: 24.0, fontWeight: semiBold),
              ),
            ),
            const SizedBox(height: 300.0),
            Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'We already sent an email to ',
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: regular),
                            children: <TextSpan>[
                          TextSpan(
                              text: email,
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12))
                        ])),
                    Text('please check your inbox',
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: regular))
                  ],
                )),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'Log in',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
