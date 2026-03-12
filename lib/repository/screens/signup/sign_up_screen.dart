import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/widgets/custom_btn.dart';
import 'package:shopbiz/repository/widgets/custom_text_form_field.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? username, email, password;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (username != null && email != null && password != null) {
      try {
        final usersRef = FirebaseFirestore.instance.collection('Users');
        final querySnapshot = await usersRef
            .where('username', isEqualTo: username!.toLowerCase())
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Username already exists"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }

        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);

        await usersRef.doc(userCredential.user!.uid).set({
          'username': username!.toLowerCase(),
          'email': email,
          'role': 'user',
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.buttonBgColor,
            content: Text(
              'User Registered Successfully',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );

        Navigator.pushReplacementNamed(context, "/loginScreen");
      } on FirebaseException catch (ex) {
        if (ex.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Password Provided Is too weak',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        } else if (ex.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Email Already Exists',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      }
    }
  }

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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.customText(
                      text: "Username : ",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: userNameController,
                      hintText: "Enter Username",
                      obscureText: false,
                      bgColor: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username Is Required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password Is Required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    CustomBtn(
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            username = userNameController.text;
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          signUp();
                        }
                      },
                      text: "Sign Up ",
                      width: MediaQuery.of(context).size.width,
                      bgColor: AppColors.buttonBgColor,
                      height: 50,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ],
                ),
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
