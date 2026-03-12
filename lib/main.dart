import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_routes.dart';
import 'package:shopbiz/firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Connected');
  } catch (ex) {
    print('Error While Connecting');
  }
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
        fontFamily: "regular",
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.adminLoginScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
