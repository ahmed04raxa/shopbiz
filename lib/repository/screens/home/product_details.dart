import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';

class ProductDetails extends StatefulWidget {
  final String img, name, details, price;
  const ProductDetails({
    super.key,
    required this.img,
    required this.name,
    required this.details,
    required this.price,
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
                Center(child: Image.network(widget.img, height: 400)),
                Positioned(
                  top: 10,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(10),
                    ),
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
                          text: widget.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        UiHelper.customText(
                          text: "\$${widget.price}",
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
                      text: widget.details,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    SizedBox(height: 90),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.buttonBgColor,
                        borderRadius: BorderRadius.circular(10),
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
