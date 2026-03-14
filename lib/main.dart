import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_routes.dart';
import 'package:shopbiz/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: "https://kddicicwulkoqcmnobnj.supabase.co",
    anonKey: "sb_publishable_7nLZwNYL9c_ilUoCA23bYw_kp-QfZoQ",
  );
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
      initialRoute: AppRoutes.bottomNavigationScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
