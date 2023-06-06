import 'package:flutter/material.dart';

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
            const Center(
              child: Text(
                'Email Sent',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
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
                            children: <TextSpan>[
                          TextSpan(
                              text: email,
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])),
                    const Text('please check your inbox')
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse('0xff613EEA'))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
