import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/domain/constants/app_colors.dart';
import 'package:shopbiz/repository/screens/home/category_product_screen.dart';
import 'package:shopbiz/repository/screens/home/product_details.dart';
import 'package:shopbiz/repository/widgets/ui_helper.dart';
import 'package:shopbiz/services/firestore_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  bool search = false;
  List categories = [
    "assets/images/headphone_icon.png",
    "assets/images/laptop.png",
    "assets/images/watch.png",
    "assets/images/TV.png",
  ];
  List categoryName = ['Headphones', 'Laptop', 'Watch', 'Tv'];
  var queryResult = [];
  var tempSearchStore = [];
  void initiateSearch(String value) {
    if (value.isEmpty) {
      setState(() {
        queryResult = [];
        tempSearchStore = [];
        search = false;
      });
      return;
    }

    setState(() {
      search = true;
    });
    if (queryResult.isEmpty && value.length == 1) {
      FirestoreService().search(value).then((QuerySnapshot docs) {
        setState(() {
          queryResult = docs.docs.map((doc) => doc.data()).toList();
          tempSearchStore = queryResult;
        });
      });
    } else {
      tempSearchStore = [];

      for (var element in queryResult) {
        if (element['UpdatedName'].toString().toUpperCase().startsWith(
          value.toUpperCase(),
        )) {
          tempSearchStore.add(element);
        }
      }

      setState(() {});
    }
  }

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
                  onChanged: (value) {
                    initiateSearch(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 13,
                    ),
                    hintText: "Search Product",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: search
                        ? GestureDetector(
                            onTap: () {
                              search = false;
                              tempSearchStore = [];
                              queryResult = [];
                              searchController.clear();
                              setState(() {});
                            },
                            child: Icon(Icons.close, color: Colors.black),
                          )
                        : Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              search
                  ? ListView(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      primary: false,
                      shrinkWrap: true,
                      children: tempSearchStore.map((element) {
                        return buildResultCard(element);
                      }).toList(),
                    )
                  : Column(
                      children: [
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
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.all(20),
                              height: 130,
                              decoration: BoxDecoration(
                                color: AppColors.buttonBgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: UiHelper.customText(
                                  text: "All",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "bold",
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.zero,
                                height: 130,
                                child: ListView.builder(
                                  itemCount: categories.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CategoryTile(
                                      image: categories[index],
                                      name: categoryName[index],
                                    );
                                  },
                                ),
                              ),
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
                                onTap: () {},
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
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
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildResultCard(data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              img: data['imgUrl'],
              name: data['Name'],
              details: data['Details'],
              price: data['Price'],
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data['imgUrl'],
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            UiHelper.customText(
              text: data['Name'],
              fontWeight: FontWeight.bold,
              fontFamily: "bold",
              fontSize: 22,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image, name;
  const CategoryTile({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductScreen(category: name),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(20),
        width: 90,
        height: 90,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),
            SizedBox(height: 10),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
