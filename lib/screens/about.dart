import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "About Us",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: ListView(
              children: [
                SizedBox(height: 25),
                Text(
                  "Who we are",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  "We are a team of passionate sports bettors and we love what we do. We like to analyse all opportunities and have the best chance of winning when we place a bet.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  "Our goal",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "Our main goal is to share good opinions and information to the sports betting community, because together we can grow stronger",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 15),
                Text(
                  "What we do",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "Everyday we study many games and then we select the best ones, matches with big odds and highest probability to generate profit. After selecting our best tips we share on our apps with you guys, for free, with the intention of creating a strong and very well informed community.",
                    style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "I would like to thank you for installing our application and continuing to support us. If you have any questions, comments or feedback, feel free to email me ( contact us).",
                    style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
