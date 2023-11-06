import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/constants.dart';
import 'package:logistic_app/screens/shipment_history.dart';
import 'package:logistic_app/screens/wallet_history.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: CustomText(
              text: "Transaction History",
              weight: FontWeight.bold,
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Column(
            children: [
              TabBar(
                //indicatorColor: Colors.black,
                unselectedLabelColor: Colors.grey,

                labelColor: mycolor,
                indicatorColor: mycolor,
                tabs: [
                  Tab(
                    child: Row(children: [
                      Text("Shipment", style: TextStyle(fontSize: 16)),
                    ]),
                  ),
                  Tab(
                    child: Row(children: [
                      Text("Wallet", style: TextStyle(fontSize: 16))
                    ]),
                  ),
                ],
              ),
              Expanded(
                child:
                    TabBarView(children: [ShipmentHistory(), WalletHistory()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
