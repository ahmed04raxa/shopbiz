import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../domain/constants/app_colors.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/ui_helper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bodyBgColor,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.customText(
                      text: "Forgot Password ? ",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                UiHelper.customText(
                  text: "Don't worry we will help you \n to find password.",
                  textAlign: TextAlign.center,
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
                  controller: forgotPasswordController,
                  bgColor: Colors.white,
                  hintText: "Enter Email",
                  obscureText: false,
                  height: 50,
                  width: 317,
                  borderRadius: BorderRadius.circular(10),
                ),
                SizedBox(height: 20),
                CustomBtn(
                  callback: () {},
                  height: 50,
                  width: 317,
                  bgColor: AppColors.buttonBgColor,
                  text: 'Send Verification Email',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
