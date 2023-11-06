import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logistic_app/widgets/GradientButton/GradientButton.dart';
import 'package:get/get.dart';
import 'package:logistic_app/widgets/custom_text.dart';
import 'package:logistic_app/widgets/rounded_textfield.dart';

class Support extends StatefulWidget {
  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  String? username;

  getUserName() async {
    //username = await LocalStorage().getString("username");
  }

  bool loading = false;
  contact() async {
    /*loading = true;
    setState(() {});
    print(username);
    final res = await HttpService.post(Api.contactSupport, {
      "username": username,
      "subject": subjectController.text,
      "comment": commentController.text
    });
    final result = jsonDecode(res.data);
    if (result["Status"] == "succcess") {
      Get.defaultDialog(
        title: "${result["Report"]}",
        titleStyle:
            TextStyle(color: Color(0xFF072A6C), fontWeight: FontWeight.bold),
        middleText: "Message sent successfully",
        middleTextStyle: TextStyle(color: Color(0xFF072A6C)),
      ).then((value) => print("done"));
    } else {
      Get.defaultDialog(
        title: "${result["Report"]}",
        titleStyle:
            TextStyle(color: Color(0xFF072A6C), fontWeight: FontWeight.bold),
        middleText: "Message not sent",
        middleTextStyle: TextStyle(color: Color(0xFF072A6C)),
      ).then((value) => print("done"));
    }
    loading = false;
    setState(() {});*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 100;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Contact Support",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Subject",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              RoundedTextField(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Enter Your Message",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 350,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Leave a comment here"),
                      controller: commentController,
                      maxLines: 15,
                      maxLength: 450,
                    ))
                  ],
                ),
              ),
              SizedBox(height: 50),
              loading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      width: 220,
                      height: 50,
                      child: GradientButton(
                        title: "Submit",
                        clrs: [Colors.black, Colors.black],
                        onpressed: () async {
                          contact();
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
