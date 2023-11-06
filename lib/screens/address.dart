import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/screen_navigation.dart';
import 'package:logistic_app/screens/items_category.dart';
import 'package:logistic_app/widgets/GradientButton/GradientButton.dart';
import 'package:logistic_app/widgets/custom_text.dart';
import 'package:logistic_app/widgets/rounded_textfield.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Details",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.blueGrey[100],
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          CustomText(
                            text: "Sender's Info",
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(2, 2))
                      ]),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          RoundedTextField(
                            hint: "Pickup Address",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint:
                                "Enter correct address if different from the one above",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint: "Sender's name",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint: "State",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint: "Sender's phone number",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.blueGrey[100],
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          CustomText(
                            text: "Receiver's Info",
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(2, 2))
                      ]),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          RoundedTextField(
                            hint: "Dropp-off Address",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint:
                                "Enter correct address if different from the one above",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint: "Receiver's name",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint: "State",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundedTextField(
                            hint: "Receiver's phone number",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GradientButton(
                  title: "Continue",
                  onpressed: () {
                    changeScreen(context, ItemsCategory());
                  },
                  clrs: [Colors.black, Colors.black],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
