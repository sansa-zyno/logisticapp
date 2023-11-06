import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/screen_navigation.dart';
import 'package:logistic_app/screens/funding/fund_with_bank.dart';
import 'package:logistic_app/screens/funding/fund_with_netteller.dart';
import 'package:logistic_app/screens/funding/fund_with_skrill.dart';
import 'package:logistic_app/screens/transaction_history.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class FundWallet extends StatelessWidget {
  FundWallet({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Fund Wallet",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => FundWithBank()));
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Image.asset("images/bank.png"),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Fund with Bank ")
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => FundWithSkrill()));
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Image.asset("images/skrill.png"),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Fund with Skrill ")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => FundWithNetteller()));
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Image.asset("images/netletter.png"),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Fund with Netteller ")
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    changeScreen(context, TransactionHistory());
                  },
                  child: Container(
                      width: 100,
                      child: Text("View Transaction History",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.teal))),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
