import 'package:baby_monitoring_system/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'WelcomeButtons.dart';
import 'package:baby_monitoring_system/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/BabyLogo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Enter your Password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            WelcomeButtons(
              onPressed: () async {
                try {
                  final currentUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (currentUser == null) {
                    print("email or password field is empty");
                  } else {
                    Navigator.pushNamed(context, HomePage.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
              title: 'Log in',
              colour: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
