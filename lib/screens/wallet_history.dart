import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:logistic_app/helpers/constants.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class WalletHistory extends StatefulWidget {
  @override
  State<WalletHistory> createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  List? walletHistory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    walletHistory = [
      {"type": 0, "amount": "200"},
      {"type": 1, "amount": "300"},
      {"type": 0, "amount": "500"}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return walletHistory != null
        ? walletHistory!.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: walletHistory!.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Type: ",
                                size: 14,
                              ),
                              CustomText(
                                text: walletHistory![index]["type"] == 0
                                    ? "Account Funded"
                                    : "Payment",
                                size: 14,
                                color: walletHistory![index]["type"] == 0
                                    ? Colors.teal
                                    : Colors.red,
                                weight: FontWeight.bold,
                              ),
                            ]),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Amount: ",
                                size: 14,
                              ),
                              CustomText(
                                text: "\u20a6300",
                                size: 14,
                              )
                            ])
                      ],
                    ),
                  ));
                })
            : Container(
                height: MediaQuery.of(context).size.height - 150,
                alignment: Alignment.center,
                child: CustomText(text: "No Wallet history to show"))
        : Container(
            height: MediaQuery.of(context).size.height - 150,
            alignment: Alignment.center,
            child: CircularProgressIndicator());
  }
}
