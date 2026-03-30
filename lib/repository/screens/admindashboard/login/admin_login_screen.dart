import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../domain/constants/app_colors.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/ui_helper.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> adminLogin() async {
    await FirebaseFirestore.instance.collection('Admin').get().then((snapshot) {
      for (var result in snapshot.docs) {
        if (result.data()['username'] != usernameController.text.trim() ||
            result.data()['password'] != passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Credentials"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          Navigator.pushReplacementNamed(context, "/adminHomeScreen");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 180),
              UiHelper.customText(
                text: "Admin Panel",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(
                    text: "Username : ",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    controller: usernameController,
                    hintText: "Enter Username",
                    obscureText: false,
                    bgColor: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(height: 20),
                  UiHelper.customText(
                    text: "Password : ",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Enter Password",
                    obscureText: true,
                    bgColor: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(height: 30),
                  CustomBtn(
                    callback: () {
                      adminLogin();
                    },
                    text: "LOGIN",
                    width: MediaQuery.of(context).size.width,
                    bgColor: AppColors.buttonBgColor,
                    height: 50,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
