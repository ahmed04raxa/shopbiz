import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/widgets/custom_btn.dart';
import 'package:shopbiz/repository/widgets/custom_text_field.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UiHelper.customText(
                  text: "Create an Account",
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
            UiHelper.customText(
              text: "Name : ",
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0XFF0D0140),
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              bgColor: Colors.white,
              hintText: "Enter Name",
              obscureText: false,
              height: 50,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.circular(10),
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

            SizedBox(height: 20),
            CustomBtn(
              callback: () {},
              height: 50,
              width: MediaQuery.of(context).size.width,
              bgColor: AppColors.buttonBgColor,
              text: 'Sign Up',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            Spacer(flex: 3),
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
    );
  }
}
