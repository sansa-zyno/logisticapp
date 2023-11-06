import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/screen_navigation.dart';
import 'package:logistic_app/screens/item_description.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    List items = ["Beans", "Garri", "Rice", "Yam", "Others"];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Food",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: ListView.separated(
            itemBuilder: (ctsx, index) {
              return ListTile(
                onTap: () {
                  changeScreen(context, ItemDescription());
                },
                leading: CustomText(
                  text: items[index],
                  //weight: FontWeight.bold,
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
            itemCount: items.length),
      ),
    );
  }
}
