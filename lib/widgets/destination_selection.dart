import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:logistic_app/providers/shipping_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:logistic_app/helpers/constants.dart';
import 'package:logistic_app/helpers/style.dart';
import 'package:google_maps_webservice/places.dart';

class DestinationSelectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShippingProvider shippingProvider = Provider.of<ShippingProvider>(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      builder: (BuildContext context, myscrollController) {
        return Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(.8),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          child: ListView(
            controller: myscrollController,
            children: [
              Icon(
                Icons.remove,
                size: 40,
                color: grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  color: grey.withOpacity(.3),
                  child: TextField(
                    onTap: () async {
                      Prediction? p = await PlacesAutocomplete.show(
                          offset: 0,
                          radius: 1000,
                          strictbounds: false,
                          region: "NG",
                          language: "EN",
                          context: context,
                          mode: Mode.overlay,
                          apiKey: GOOGLE_MAPS_API_KEY,
                          sessionToken: "eeeeeeeee",
                          components: [new Component(Component.country, "NG")],
                          types: [],
                          hint: "Search City",
                          startText: "");
                      if (p != null) {
                        PlacesDetailsResponse detail =
                            await places.getDetailsByPlaceId(p.placeId!);
                        double lat = detail.result.geometry!.location.lat;
                        double lng = detail.result.geometry!.location.lng;
                        /*shippingProvider.changeRequestedDestination(
                            reqDestination: p.description, lat: lat, lng: lng);*/
                        shippingProvider.updateDestination(
                            destination: p.description);
                        LatLng coordinates = LatLng(lat, lng);
                        shippingProvider.setDestination(
                            coordinates: coordinates);
                        log("a");
                        shippingProvider
                            .addPickupMarker(shippingProvider.center!);
                        log("b");
                        shippingProvider.changeWidgetShowed(
                            showWidget: Show.PICKUP_SELECTION);
                      }
                    },
                    textInputAction: TextInputAction.go,
                    controller: shippingProvider.destinationController,
                    cursorColor: Colors.blue.shade900,
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, bottom: 15),
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.location_on,
                          color: red,
                        ),
                      ),
                      hintText: "Destination to deliver your items ",
                      hintStyle: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nunito"),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              shippingProvider.locations.isNotEmpty
                  ? ListView.builder(
                      itemCount: shippingProvider.locations.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) => ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepOrange[300],
                              child: Icon(
                                Icons.location_city,
                                color: white,
                              ),
                            ),
                            title: Text("Address ${index + 1}"),
                            subtitle:
                                Text("${shippingProvider.locations[index]}"),
                          ))
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
