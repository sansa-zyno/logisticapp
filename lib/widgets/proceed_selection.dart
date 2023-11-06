import 'package:logistic_app/helpers/screen_navigation.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/style.dart';
import 'package:logistic_app/screens/address.dart';

class Proceed extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldState;
  Proceed({this.scaffoldState});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      builder: (BuildContext context, myscrollController) {
        return Container(
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(.8),
                      offset: Offset(3, 2),
                      blurRadius: 7)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () async {
                  changeScreen(context, Address());
                },
                // color: Colors.blue,
                child: Text(
                  "Proceed",
                  style: TextStyle(color: white, fontSize: 16),
                ),
              ),
            ));
      },
    );
  }
}
