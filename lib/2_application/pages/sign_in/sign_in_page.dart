import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rnd_clean_architecture/2_application/components/molecule/regular_input.dart';
import 'package:rnd_clean_architecture/2_application/pages/pages.dart';
import 'package:rnd_clean_architecture/2_application/pages/sign_up/sign_up_page.dart';

import '../../components/molecule/animation_section.dart';
import '../../components/molecule/password_input.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const routeName = '/signIn';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  String email = '', pass = '';

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((result) {
      context.pushReplacement(WeatherPage.routeName);
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
                child: Text(
              'Weather Sign In',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )),
            const SizedBox(height: 30),
            const WeatherAnimation(),
            const SizedBox(height: 30),
            RegularInput(
              controller: emailCtrl,
              label: 'email',
              inputType: TextInputType.emailAddress,
              onChange: (v) {
                setState(() {
                  email = v;
                });
              },
              // errorText: emailError,
            ),
            const SizedBox(height: 10),
            PasswordInput(
              controller: passCtrl,
              label: 'password',
              onChange: (v) {
                setState(() {
                  pass = v;
                });
              },
              // errorText: passwordError,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: email.isNotEmpty && pass.isNotEmpty
                  ? () => logInToFb()
                  : null,
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have account ? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Sign up now ',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push(SignUpPage.routeName),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
