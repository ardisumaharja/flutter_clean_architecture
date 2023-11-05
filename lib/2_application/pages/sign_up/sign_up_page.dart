import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rnd_clean_architecture/2_application/pages/pages.dart';

import '../../components/molecule/animation_section.dart';
import '../../components/molecule/password_input.dart';
import '../../components/molecule/regular_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/signUp';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController passConfirmCtrl = TextEditingController();

  String email = '', pass = '', passConfirm = '';

  void checkPassword(String pass1, String pass2) {
    if (pass1 == pass2) {
      registerToFb();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Password not match"),
              content: const Text('Please check your password'),
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
    }
  }

  void registerToFb() {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: pass,
          )
          .then((value) => {context.go(WeatherPage.routeName)});
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(message),
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
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(e.toString()),
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
    }
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    passConfirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Sign Up',
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.lightBlue,
      //   leading: const BackButton(color: Colors.white),
      // ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
                child: Text(
              'Weather Sign Up',
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
            const SizedBox(height: 10),
            PasswordInput(
              controller: passConfirmCtrl,
              label: 'password confirm',
              onChange: (v) {
                setState(() {
                  passConfirm = v;
                });
              },
              // errorText: passwordError,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  email.isNotEmpty && pass.isNotEmpty && passConfirm.isNotEmpty
                      ? () => checkPassword(pass, passConfirm)
                      : null,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
