import 'package:flutter/material.dart';
import 'package:shopbiz/repository/screens/login/login_screen.dart';
import 'package:shopbiz/repository/screens/signup/sign_up_screen.dart';

import '../../repository/screens/forgot_password/forgot_password_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String loginScreen = "/loginScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static Map<String, Widget Function(BuildContext context)> getRoutes() => {
    signUpScreen: (context) => SignUpScreen(),
    loginScreen: (context) => LoginScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
  };
}
