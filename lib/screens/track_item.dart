import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/constants.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class TrackItem extends StatefulWidget {
  @override
  _TrackItemState createState() => _TrackItemState();
}

class _TrackItemState extends State<TrackItem> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var order_id=ModalRoute.of(context).settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Track Item",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.only(left: 15, right: 10, top: 10),
                color: Color(0xffF5F5F5),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/originals/2e/39/ae/2e39ae43a252f6d5dde9d9337526530d.jpg"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("(Driver)",
                            style: TextStyle(
                              color: Color(0xff0B2E40),
                            )),
                        SizedBox(
                          width: 160,
                        ),
                        CircleAvatar(
                          child: Icon(
                            Icons.call,
                            color: Color(0xffFFFFFF),
                            size: 11.23,
                          ),
                          backgroundColor: mycolor,
                          radius: 13,
                        ),
                      ],
                    )),
              ),
              Container(
                height: (MediaQuery.of(context).size.height * 0.6),
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 10, top: 50),
                child: Column(
                  children: [
                    //order placed
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Item Placed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text("The item has been placed")
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    //confirmed
                    FutureBuilder(
                      future: null,
                      builder: (contyext, snapshot) {
                        return Row(
                          children: [
                            snapshot.data != null
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.teal),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: mycolor,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Item Confirmed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text("The item has been confirmed")
                              ],
                            ))
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    FutureBuilder(
                      future: null,
                      builder: (context, snapshot) {
                        return Row(
                          children: [
                            snapshot.data != null
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.teal),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Item is in route",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "The item is in the route to the destination")
                                ],
                              )),
                            )
                          ],
                        );
                      },
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    FutureBuilder(
                        future: null,
                        builder: (context, snapshot) {
                          return Row(
                            children: [
                              snapshot.data != null
                                  ? Container(
                                      height: 300,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.teal),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: mycolor,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivered",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text("The item has been delivered")
                                ],
                              ))
                            ],
                          );
                        }),

                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
