import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/repository/widgets/custom_text_form_field.dart';
import '../../../domain/constants/app_colors.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email = "", password = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.buttonBgColor,
          content: Text(
            'User LoggedIn Successfully',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/bottomNavigationScreen",
        (route) => false,
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found' ||
          ex.code == 'wrong-password' ||
          ex.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Invalid Credentials',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(ex.message ?? "Login Failed"),
          ),
        );
      }
    }
  }

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
                fontFamily: "bold",
              ),
              SizedBox(height: 10),
              UiHelper.customText(
                text: "Discover Limitless Choices and Unmatched\nConvenience",
                textAlign: TextAlign.start,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.customText(
                      text: "Email : ",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0D0140),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Enter Email",
                      obscureText: false,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(10),
                      bgColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email Is Required";
                        } else if (!value.contains("@")) {
                          return "Enter valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    UiHelper.customText(
                      text: "Password : ",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0D0140),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: "Enter Password",
                      obscureText: true,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(10),
                      bgColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password Is Required";
                        }
                        return null;
                      },
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
                            Navigator.pushNamed(
                              context,
                              "/forgotPasswordScreen",
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomBtn(
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          login();
                        }
                      },
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      bgColor: AppColors.buttonBgColor,
                      text: 'Login',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ],
                ),
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
