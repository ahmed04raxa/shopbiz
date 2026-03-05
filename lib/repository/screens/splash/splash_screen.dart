import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/loginScreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset("assets/images/logo.png"),
            //Text('SPLASH SCREEN')
            UiHelper.customImage(imgUrl: "logo.png"),
          ],
        ),
      ),
    );
  }
}
