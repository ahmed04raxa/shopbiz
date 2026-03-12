import 'package:flutter/material.dart';
import 'package:shopbiz/repository/screens/admindashboard/login/admin_login_screen.dart';
import 'package:shopbiz/repository/screens/login/login_screen.dart';
import 'package:shopbiz/repository/screens/signup/sign_up_screen.dart';
import 'package:shopbiz/repository/screens/splash/splash_screen.dart';
import '../../repository/screens/bottom_navigation/bottom_navigation_screen.dart';
import '../../repository/screens/forgot_password/forgot_password_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String loginScreen = "/loginScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String bottomNavigationScreen = "/bottomNavigationScreen";
  static const String adminLoginScreen = "/adminLoginScreen";
  static Map<String, Widget Function(BuildContext context)> getRoutes() => {
    splashScreen: (context) => SplashScreen(),
    signUpScreen: (context) => SignUpScreen(),
    loginScreen: (context) => LoginScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    bottomNavigationScreen: (context) => BottomNavigationScreen(),
    adminLoginScreen: (context)=>AdminLoginScreen()
  };
}
