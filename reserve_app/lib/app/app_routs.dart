import 'package:flutter/material.dart';
import 'package:reserve_app/pages/login_page.dart';
import 'package:reserve_app/pages/sign_up_page.dart';

abstract class AppRouts {
  static const loginPage = 'login';
  static const SignUpPage = 'signup';

  static Map<String, WidgetBuilder> routes = {
    loginPage: (context) => const LoginPage(),
    SignUpPage: (context)=> const SignUp(),
  };
}
