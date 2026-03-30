import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int activeIndex = 0;

  final List<String> banners = ["banner_1.jpg", "banner_2.jpg", "banner_3.jpg"];
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 13,
                    ),
                    hintText: "Search Product",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  CarouselSlider(
                    items: banners
                        .map(
                          (banner) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: UiHelper.customImage(
                              imgUrl: banner,
                              width: 350,
                              height: 61,
                              boxFit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: banners.length,
                    effect: WormEffect(
                      dotHeight: 15,
                      dotWidth: 15,
                      spacing: 10,
                      activeDotColor: AppColors.buttonBgColor,
                      dotColor: Colors.grey.shade300,
                    ),
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
