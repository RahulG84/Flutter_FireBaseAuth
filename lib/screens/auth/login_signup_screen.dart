import 'package:flutter/material.dart';
import 'package:login_signup_with_firebase/screens/login/login_screen.dart';
import 'package:login_signup_with_firebase/screens/signup/signup_screen.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  bool isLogin = true;
  void togglePage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return Login(onPressed: togglePage);
    } else {
      return SignUp(onPressed: togglePage);
    }
  }
}
