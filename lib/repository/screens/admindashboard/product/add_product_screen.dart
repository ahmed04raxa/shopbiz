import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/widgets/custom_btn.dart';
import 'package:shopbiz/repository/widgets/custom_text_form_field.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';
import 'package:shopbiz/services/firestore_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final List<String> categoryItem = ['Headphones', 'Laptop', 'Watch', 'Tv'];
  String? value;
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();
  File? selectedImage;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDetailsController =
      TextEditingController();
  Future pickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  Future<void> addProduct() async {
    if (selectedImage != null &&
        productNameController.text != "" &&
        productPriceController.text != "" &&
        productDetailsController.text != "") {
      final fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      final filePath = "productImages/$fileName";
      await Supabase.instance.client.storage
          .from('productImage')
          .upload(filePath, selectedImage!);
      final imageUrl = Supabase.instance.client.storage
          .from('productImage')
          .getPublicUrl(filePath);
      Map<String, dynamic> productInfoMap = {
        "Name": productNameController.text,
        "Price": productPriceController.text,
        "Details": productDetailsController.text,
        "imgUrl": imageUrl,
      };
      await FirestoreService()
          .addProduct(productInfoMap, value!)
          .then(
            (value) => {
              selectedImage = null,
              productNameController.text = "",
              productPriceController.text = "",
              productDetailsController.text = "",
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Product Uploaded Successfully"),
                ),
              ),
            },
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("All Fields Are Required"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bodyBgColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              UiHelper.customText(
                text: "Upload Product Image",
                color: Colors.black,
                fontFamily: "bold",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: selectedImage != null
                    ? Center(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: Colors.black45,
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: productNameController,
                      hintText: "Product Name",
                      obscureText: false,
                      bgColor: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: productPriceController,
                      hintText: "Product Price",
                      obscureText: false,
                      bgColor: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: productDetailsController,
                      hintText: "Product Details",
                      obscureText: false,
                      bgColor: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        value: value,
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text(
                          "Select Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "bold",
                            fontSize: 20,
                          ),
                        ),
                        items: categoryItem.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomBtn(
                      callback: () {
                        addProduct();
                      },
                      text: "Add Products",
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      bgColor: AppColors.buttonBgColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
