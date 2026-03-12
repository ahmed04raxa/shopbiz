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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 180),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UiHelper.customText(
                    text: "Admin",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 10),
              UiHelper.customText(
                text: "Please enter the details below to \ncontinue.",
                textAlign: TextAlign.start,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.customText(
                      text: "Username : ",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    SizedBox(height: 10),

                    UiHelper.customText(
                      text: "Email : ",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Enter Email",
                      obscureText: false,
                      bgColor: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email Is Required";
                        }
                        return null;
                      },
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


              SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(text: "Already have an account?"),
                  UiHelper.customTextButton(
                    text: "Login",
                    color: AppColors.buttonBgColor,
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/loginScreen");
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
