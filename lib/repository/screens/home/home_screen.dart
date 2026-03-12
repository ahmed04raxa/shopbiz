import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/screens/home/product_details.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';
import '../../widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bodyBgColor,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: UiHelper.customImage(
                imgUrl: "boy.jpg",
                height: 50,
                width: 50,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: searchController,
                    bgColor: Colors.white,
                    hintText: "Enter Search",
                    obscureText: true,
                    height: 50,
                    width: 312,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.buttonBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.black, size: 35),
                ),
              ],
            ),
            SizedBox(height: 20),
            CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: UiHelper.customImage(
                    imgUrl: "banner_1.jpg",
                    width: 350,
                    height: 61,
                    boxFit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: UiHelper.customImage(
                    imgUrl: "banner_2.jpg",
                    width: 350,
                    height: 61,
                    boxFit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: UiHelper.customImage(
                    imgUrl: "banner_3.jpg",
                    width: 350,
                    height: 61,
                    boxFit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(viewportFraction: 1),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.customText(
                  text: "Categories",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                UiHelper.customTextButton(
                  text: "see all",
                  onPressed: () {},
                  color: AppColors.buttonBgColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 240,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          UiHelper.customImage(
                            imgUrl: "headphone_icon.png",
                            height: 150,
                            width: 150,
                            boxFit: BoxFit.cover,
                          ),
                          UiHelper.customText(
                            text: "Headphones",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              UiHelper.customText(
                                text: "\$10",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.buttonBgColor,
                              ),
                              SizedBox(width: 30),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonBgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        UiHelper.customImage(
                          imgUrl: "watch2.png",
                          height: 150,
                          width: 150,
                          boxFit: BoxFit.cover,
                        ),
                        UiHelper.customText(
                          text: "Apple Watch",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            UiHelper.customText(
                              text: "\$10",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonBgColor,
                            ),
                            SizedBox(width: 30),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.buttonBgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        UiHelper.customImage(
                          imgUrl: "laptop.png",
                          height: 150,
                          width: 150,
                          boxFit: BoxFit.cover,
                        ),
                        UiHelper.customText(
                          text: "Laptop",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            UiHelper.customText(
                              text: "\$10",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonBgColor,
                            ),
                            SizedBox(width: 30),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.buttonBgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
