import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/widgets/custom_btn.dart';
import 'package:shopbiz/repository/widgets/custom_text_field.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDetailsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bodyBgColor,
        leading: GestureDetector(
          onTap: () {
            //Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: UiHelper.customText(
          text: "Add Products",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "bold",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 50,
                    color: AppColors.buttonBgColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            CustomTextField(
              controller: productNameController,
              hintText: "Enter Product Name",
              obscureText: false,
              bgColor: Colors.white,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.circular(10),
              height: 60,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: productPriceController,
              hintText: "Enter Product Price",
              obscureText: false,
              bgColor: Colors.white,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.circular(10),
              height: 60,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: productDetailsController,
              hintText: "Enter Product Detail",
              obscureText: false,
              bgColor: Colors.white,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.circular(10),
              height: 60,
            ),
            SizedBox(height: 20),
            Spacer(),
            CustomBtn(
              callback: () {},
              text: "Add Product",
              width: MediaQuery.of(context).size.width,
              height: 60,
              bgColor: AppColors.buttonBgColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
