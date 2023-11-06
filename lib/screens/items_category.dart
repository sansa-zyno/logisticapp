import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/screen_navigation.dart';
import 'package:logistic_app/screens/items.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class ItemsCategory extends StatefulWidget {
  const ItemsCategory({super.key});

  @override
  State<ItemsCategory> createState() => _ItemsCategoryState();
}

class _ItemsCategoryState extends State<ItemsCategory> {
  List categories = [
    "Food",
    "Clothing/Shoes",
    "Electronics",
    "Jewelries/Accessories",
    "Documents",
    "Health Products",
    "Computer Accessories",
    "Phones",
    "Others"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Item Categories",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          //shape: Border(bottom: BorderSide())
        ),
        body: ListView.separated(
            itemBuilder: (ctsx, index) {
              return ListTile(
                onTap: () {
                  changeScreen(context, Items());
                },
                leading: CustomText(
                  text: categories[index],
                  // weight: FontWeight.bold,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              );
            },
            separatorBuilder: (ctx, index) => Divider(
                  thickness: 1.5,
                ),
            itemCount: categories.length),
      ),
    );
  }
}
