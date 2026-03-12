import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';

class ProductDetails extends StatefulWidget {
  //String img, name, price;
  ProductDetails({
    super.key,
    // required this.img,
    // required this.name,
    // required this.price,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
                Center(
                  child: UiHelper.customImage(
                    imgUrl: "headphone2.png",
                    height: 400,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UiHelper.customText(
                          text: "Headphone",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        UiHelper.customText(
                          text: "\$ 20",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.buttonBgColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    UiHelper.customText(
                      text: "Details",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    SizedBox(height: 10),
                    UiHelper.customText(
                      text:
                          "This Is The Detail of product This Is The Detail of product This Is The Detail of product This Is The Detail of product This Is The Detail of product ",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    SizedBox(height: 90,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.buttonBgColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: UiHelper.customText(
                          text: "Buy Now",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
