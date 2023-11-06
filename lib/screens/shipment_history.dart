import 'package:flutter/material.dart';
import 'package:logistic_app/widgets/custom_text.dart';

class ShipmentHistory extends StatefulWidget {
  @override
  State<ShipmentHistory> createState() => _ShipmentHistoryState();
}

class _ShipmentHistoryState extends State<ShipmentHistory> {
  List? shipmentHistory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shipmentHistory = [
      {
        "id": "8234567",
        "type": "Food items",
        "amount": "200",
        "from": "irewon, Ijebu ode",
        "to": "Ikeja, Lagos"
      },
      {
        "id": "8234568",
        "type": "Electronics",
        "amount": "300",
        "from": "Molipa, Ijebu ode",
        "to": "Surulere, Lagos"
      },
      {
        "id": "8234569",
        "type": "Jewelries",
        "amount": "500",
        "from": "Oke owa, Ijebu ode",
        "to": "Badagry, Lagos"
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return shipmentHistory != null
        ? shipmentHistory!.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: shipmentHistory!.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "Tracking Id: ",
                              size: 14,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: shipmentHistory![index]["id"],
                              size: 14,
                              color: Colors.teal,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Type: ",
                              size: 14,
                            ),
                            CustomText(
                              text: shipmentHistory![index]["type"],
                              size: 14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "From: ",
                              size: 14,
                            ),
                            CustomText(
                              text: shipmentHistory![index]["from"],
                              size: 14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "To: ",
                              size: 14,
                            ),
                            CustomText(
                              text: shipmentHistory![index]["to"],
                              size: 14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Amount: ",
                              size: 14,
                            ),
                            CustomText(
                              text:
                                  "\u20a6${shipmentHistory![index]["amount"]}",
                              size: 14,
                            )
                          ],
                        ),
                      ],
                    ),
                  ));
                })
            : Container(
                height: MediaQuery.of(context).size.height - 150,
                alignment: Alignment.center,
                child: CustomText(text: "No Shipment history to show"))
        : Container(
            height: MediaQuery.of(context).size.height - 150,
            alignment: Alignment.center,
            child: CircularProgressIndicator());
  }
}
