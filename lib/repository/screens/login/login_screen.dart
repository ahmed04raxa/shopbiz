import 'package:flutter/material.dart';
import '../../../domain/constants/app_colors.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              UiHelper.customText(
                text: "Welcome Back !",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              UiHelper.customText(
                text: "Discover Limitless Choices and Unmatched\nConvenience",
                textAlign: TextAlign.start,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              UiHelper.customText(
                text: "Email : ",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0XFF0D0140),
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: emailController,
                bgColor: Colors.white,
                hintText: "Enter Email",
                obscureText: false,
                height: 50,
                width: MediaQuery.of(context).size.width,
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(height: 20),
              UiHelper.customText(
                text: "Password : ",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0XFF0D0140),
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                bgColor: Colors.white,
                hintText: "Enter Password",
                obscureText: true,
                height: 50,
                width: MediaQuery.of(context).size.width,
                borderRadius: BorderRadius.circular(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UiHelper.customTextButton(
                    text: "Forgot Password ?",
                    color: AppColors.buttonBgColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    onPressed: () {
                      Navigator.pushNamed(context, "/forgotPasswordScreen");
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomBtn(
                callback: () {
                  Navigator.pushNamed(context, "/bottomNavigationScreen");
                },
                height: 50,
                width: MediaQuery.of(context).size.width,
                bgColor: AppColors.buttonBgColor,
                text: 'Login',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(text: "Don't have an account?"),
                  UiHelper.customTextButton(
                    text: "Sign Up",
                    color: AppColors.buttonBgColor,
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/signUpScreen");
                    },
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
