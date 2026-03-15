import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/repository/screens/home/product_details.dart';
import 'package:shopbiz/services/firestore_service.dart';

import '../../../domain/constants/app_colors.dart';
import '../../widgets/ui_helper.dart';

class CategoryProductScreen extends StatefulWidget {
  String category;
  CategoryProductScreen({super.key, required this.category});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  Stream? categoryStream;
  void getOnLoad() async {
    categoryStream = await FirestoreService().getProducts(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getOnLoad();
  }

  Widget allProduct() {
    return StreamBuilder(
      stream: categoryStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          ds['imgUrl'],
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        UiHelper.customText(
                          text: ds['Name'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            UiHelper.customText(
                              text: "\$${ds['Price']}",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonBgColor,
                            ),
                            SizedBox(width: 47),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                      img: ds['imgUrl'],
                                      name: ds['Name'],
                                      details: ds['Details'],
                                      price: ds['Price'],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            : SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bodyBgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [Expanded(child: allProduct())]),
      ),
    );
  }
}
