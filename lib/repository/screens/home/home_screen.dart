import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200,),
          CustomTextField(
            controller: searchController,
            bgColor: Colors.white,
            hintText: "Enter Search",
            obscureText: true,
            height: 50,
            width: MediaQuery.of(context).size.width,
            borderRadius: BorderRadius.circular(10),
          ),

        ],
      ),
    );
  }
}
