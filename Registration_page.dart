import 'package:baby_monitoring_system/constants.dart';
import 'package:baby_monitoring_system/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'WelcomeButtons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String passwd;
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
                passwd = value;
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Enter your Password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            WelcomeButtons(
              onPressed: () async {
                Navigator.pushNamed(context, RegistrationScreen.id);
                //print(email);
                //print(passwd);
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: passwd);
                  if (newUser == null) {
                    print("email or password field is empty");
                  }
                } catch (e) {
                  print(e);
                }
              },
              title: 'Register',
              colour: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
