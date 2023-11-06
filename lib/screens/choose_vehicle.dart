/*import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/screen_navigation.dart';
import 'package:logistic_app/helpers/style.dart';
import 'package:logistic_app/screens/ship_now.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class ChooseVehicle extends StatefulWidget {
  const ChooseVehicle({super.key});

  @override
  State<ChooseVehicle> createState() => _ChooseVehicleState();
}

class _ChooseVehicleState extends State<ChooseVehicle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 160,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/logbkimg4.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Hello Zyno, ",
                        color: Colors.teal,
                        weight: FontWeight.w900,
                      ),
                    ],
                  ),
                  /*SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text:
                        "Please select the most suitable vehicle to pick up your item(s)",
                  ),
                  SizedBox(
                    height: 30,
                  )*/
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white10,
                child: ListView(
                  padding: EdgeInsets.all(8),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, ShipNow());
                        },
                        child: Card(
                            child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Image.asset(
                                  "images/motorcycle.png",
                                  height: 50,
                                  width: 120,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Motor Bike"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomText(
                                      text:
                                          "Ideal for lightweight items: International passport, human hair, mobile phones, medicince etec",
                                      size: 12,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, ShipNow());
                        },
                        child: Card(
                            child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Image.asset(
                                  "images/car.png",
                                  height: 50,
                                  width: 120,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Car"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomText(
                                      text:
                                          "For items that fit a motor bike: Microwaves, Bags of clothes, Television etc",
                                      size: 12,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, ShipNow());
                        },
                        child: Card(
                            child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Image.asset(
                                  "images/minivan.png",
                                  height: 50,
                                  width: 120,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Mini Van"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomText(
                                      text:
                                          "Ideal for big and bulky items: Refigerator, Watching machine, Air conditioner, Standing fan etec",
                                      size: 12,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, ShipNow());
                        },
                        child: Card(
                            child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Image.asset(
                                  "images/truck.png",
                                  height: 50,
                                  width: 120,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Truck"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomText(
                                      text:
                                          "Perfect for moving very large items: Furniture, Office equipment, Outdoor equipment etec",
                                      size: 12,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}*/
