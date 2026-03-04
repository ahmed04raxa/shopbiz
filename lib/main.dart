import 'package:flutter/material.dart';
import 'package:shopbiz/repository/screens/admindashboard/adminhome/admin_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopBiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF0000FF)),
      ),
      home: AdminHomeScreen(),
    );
  }
}