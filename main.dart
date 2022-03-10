import 'package:baby_monitoring_system/homepage.dart';
import 'package:flutter/material.dart';
import 'package:baby_monitoring_system/Welcome_page.dart';
import 'package:baby_monitoring_system/Login_page.dart';
import 'package:baby_monitoring_system/Registration_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        appId: "1:418822486847:android:8e4c25f8985cd30458f18a",
        messagingSenderId: "418822486847",
        projectId: "baby-monitor-e77c6",
        apiKey: 'AIzaSyDjDXBfWk6YqnoKdgLxKdXgw0MnsxTOG6Y',
        databaseURL: 'https://baby-monitor-e77c6-default-rtdb.firebaseio.com'),
  );
  runApp(BabyMonitor());
}

class BabyMonitor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
