import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup_with_firebase/screens/auth/auth_screen.dart';
import 'package:login_signup_with_firebase/screens/demo_screen.dart';
import 'package:login_signup_with_firebase/screens/home/home_screen.dart';
import 'package:login_signup_with_firebase/screens/login/login_screen.dart';
import 'package:login_signup_with_firebase/screens/signup/signup_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Auth Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const AuthScreen(),
    );
  }
}
