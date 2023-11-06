import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/screen_navigation.dart';
import 'package:logistic_app/screens/funding/fund_wallet.dart';
import 'package:logistic_app/screens/ship_now.dart';
import 'package:logistic_app/screens/support.dart';
import 'package:logistic_app/screens/track_item.dart';
import 'package:logistic_app/screens/transaction_history.dart';
import 'package:logistic_app/widgets/custom_text.dart';
import 'package:logistic_app/widgets/menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Menu(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/logbkimg1.jpg",
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Good morning",
                        //color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    text: "John Doe",
                    //color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            changeScreen(context, TrackItem());
                          },
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            child: Center(
                                child: CustomText(
                              text: "Track",
                              color: Colors.white,
                              size: 14,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(2, 2))
                ]),
                child: Column(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(2, 2))
                      ]),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  border: Border.all(color: Colors.white),
                                  shape: BoxShape.circle),
                              child: CustomText(
                                text: "\u20a6",
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "Wallet Balance"),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(
                                text: "0.00",
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              changeScreen(context, FundWallet());
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(8)),
                              child: CustomText(
                                text: "Fund Wallet",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "images/logbkimg4.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  GridView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              changeScreen(context, ShipNow());
                                            },
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "images/motorcycle.png",
                                                      width: 50,
                                                    ),
                                                    /*SizedBox(
                                                      height: 8,
                                                    ),*/
                                                    CustomText(
                                                      text: "Motor Bike",
                                                      weight: FontWeight.bold,
                                                      color: Colors.teal,
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "Ideal for lightweight items: International passport, mobile phones, medicince etc",
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              changeScreen(context, ShipNow());
                                            },
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "images/car2.png",
                                                      width: 50,
                                                    ),
                                                    /*SizedBox(
                                                      height: 8,
                                                    ),*/
                                                    CustomText(
                                                      text: "Car",
                                                      weight: FontWeight.bold,
                                                      color: Colors.teal,
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "For items that fit a motor bike: Microwaves, Bags of clothes, Television etc",
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              changeScreen(context, ShipNow());
                                            },
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "images/minivan.png",
                                                      width: 50,
                                                    ),
                                                    /*SizedBox(
                                                      height: 8,
                                                    ),*/
                                                    CustomText(
                                                      text: "Mini Van",
                                                      weight: FontWeight.bold,
                                                      color: Colors.teal,
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "Ideal for big and bulky items: Refigerator, Watching machine, Air conditioner, Standing fan etec",
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              changeScreen(context, ShipNow());
                                            },
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "images/truck2.jpg",
                                                      width: 50,
                                                    ),
                                                    /*SizedBox(
                                                      height: 8,
                                                    ),*/
                                                    CustomText(
                                                      text: "Truck",
                                                      weight: FontWeight.bold,
                                                      color: Colors.teal,
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "Perfect for moving very large items: Furniture, Office equipment, Outdoor equipment etec",
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.70)),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GridView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: InkWell(
                                        onTap: () {
                                          changeScreen(
                                              context, TransactionHistory());
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "images/transactional.png",
                                                  width: 50,
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CustomText(
                                                  text: "Transactions",
                                                  weight: FontWeight.bold,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                CustomText(
                                                  text: "Customer Dashboard",
                                                  size: 14,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: InkWell(
                                        onTap: () {
                                          changeScreen(context, Support());
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "images/note.png",
                                                  width: 50,
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CustomText(
                                                  text: "Support",
                                                  weight: FontWeight.bold,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                CustomText(
                                                  text: "Contact Support",
                                                  size: 14,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    /*Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                "images/note.png",
                                                width: 40,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              CustomText(
                                                text: "Get Quotes",
                                                weight: FontWeight.bold,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              CustomText(
                                                text:
                                                    "Compare prices accross weights and locations",
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),*/
                                  ],
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.9)),
                            ],
                          ),
                        ),
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
}
