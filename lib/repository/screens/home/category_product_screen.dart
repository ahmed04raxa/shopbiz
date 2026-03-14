import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Image.network(
                          ds['imgUrl'],
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        UiHelper.customText(
                          text: ds['Name'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            UiHelper.customText(
                              text: "\$${ds['Price']}",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonBgColor,
                            ),
                            SizedBox(width: 55),
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
      appBar: AppBar(backgroundColor: AppColors.bodyBgColor),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [Expanded(child: allProduct())]),
      ),
    );
  }
}
