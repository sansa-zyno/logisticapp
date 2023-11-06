import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:logistic_app/helpers/constants.dart';
import 'package:logistic_app/helpers/style.dart';
import 'package:logistic_app/providers/shipping_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic_app/widgets/custom_text.dart';
import 'package:logistic_app/widgets/menu.dart';
import 'package:logistic_app/widgets/proceed_selection.dart';
import 'package:logistic_app/widgets/destination_selection.dart';
import 'package:logistic_app/widgets/pickup_selection_widget.dart';
import 'package:provider/provider.dart';
import "package:google_maps_webservice/places.dart";

class ShipNow extends StatefulWidget {
  ShipNow({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _ShipNowState createState() => _ShipNowState();
}

class _ShipNowState extends State<ShipNow> {
  var scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //FirebaseMessaging.instance.getInitialMessage();
    // _deviceToken();
    ShippingProvider shippingProvider =
        Provider.of<ShippingProvider>(context, listen: false);
    shippingProvider.setCustomMapPin(context);
  }

  /*_deviceToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    UserProvider _user = Provider.of<UserProvider>(context, listen: false);

    if (_user.userModel?.token != preferences.getString('token')) {
      Provider.of<UserProvider>(context, listen: false).saveDeviceToken();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    //UserProvider userProvider = Provider.of<UserProvider>(context);
    //AppStateProvider appState = Provider.of<AppStateProvider>(context);
    ShippingProvider shippingProvider = Provider.of<ShippingProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        drawer: Menu(),
        body: Stack(
          children: [
            MapScreen(scaffoldState),
            Visibility(
              visible: shippingProvider.showForVendor == Show.PICKUP_SELECTION,
              child: Padding(
                padding: const EdgeInsets.only(left: 70, top: 5, right: 70),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
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
                        shippingProvider
                            .addPickupMarker(shippingProvider.center!);
                        shippingProvider.changeWidgetShowed(
                            showWidget: Show.PICKUP_SELECTION);
                      }
                    },
                    textInputAction: TextInputAction.go,
                    controller: shippingProvider.destinationController,
                    cursorColor: Colors.blue.shade900,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          shippingProvider.changeWidgetShowed(
                              showWidget: Show.DESTINATION_SELECTION);
                        },
                      ),
                      hintText: "Enter destination",
                      label: CustomText(
                        text: "Destination",
                      ),
                      hintStyle: TextStyle(
                        color: black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: mycolor, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: shippingProvider.showForVendor == Show.PROCEED,
              child: Padding(
                padding: const EdgeInsets.only(left: 70, top: 5, right: 70),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      )),
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
                        /*ShippingProvider.changeRequestedDestination(
                            reqDestination: p.description, lat: lat, lng: lng);
                        ShippingProvider.updateDestination(destination: p.description);*/
                        LatLng coordinates = LatLng(lat, lng);
                        shippingProvider.setPickCoordinates(
                            coordinates: coordinates);
                        shippingProvider.changePickupLocationAddress(
                            address: p.description);
                        shippingProvider.changeWidgetShowed(
                            showWidget: Show.PROCEED);
                        await shippingProvider.sendRequest();
                      }
                    },
                    textInputAction: TextInputAction.go,
                    controller: shippingProvider.pickupLocationControlelr,
                    cursorColor: Colors.blue.shade900,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                        onPressed: () {
                          shippingProvider.changeWidgetShowed(
                              showWidget: Show.PICKUP_SELECTION);
                        },
                      ),
                      hintText: "Enter Pickup location",
                      label: CustomText(text: "Pickup"),
                      hintStyle: TextStyle(
                        color: black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: mycolor, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
            ),
            // ANCHOR Draggable
            Visibility(
                visible: shippingProvider.showForVendor ==
                    Show.DESTINATION_SELECTION,
                child: DestinationSelectionWidget()),
            // ANCHOR PICK UP WIDGET
            Visibility(
              visible: shippingProvider.showForVendor == Show.PICKUP_SELECTION,
              child: PickupSelectionWidget(
                scaffoldState: scaffoldState,
              ),
            ),
            Visibility(
                visible: shippingProvider.showForVendor == Show.PROCEED,
                child: Proceed(
                  scaffoldState: scaffoldState,
                )),
            //  ANCHOR Draggable DRIVER
            /*Visibility(
                visible: shippingProvider.showForVendor == Show.DRIVER_FOUND,
                child: DriverFoundWidget()),*/

            //  ANCHOR Draggable DRIVER
            /*Visibility(
                visible: shippingProvider.showForVendor == Show.TRIP,
                child: TripWidget()),*/
          ],
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;

  MapScreen(this.scaffoldState);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapsPlaces? googlePlaces;
  TextEditingController destinationController = TextEditingController();
  Color darkBlue = Colors.black;
  Color grey = Colors.grey;
  GlobalKey<ScaffoldState> scaffoldSate = GlobalKey<ScaffoldState>();
  //final Completer<GoogleMapController> _mapController = Completer();

  @override
  void initState() {
    super.initState();
    scaffoldSate = widget.scaffoldState;
  }

  @override
  Widget build(BuildContext context) {
    // AppProvider app = Provider.of<AppProvider>(context);
    ShippingProvider shippingProvider = Provider.of<ShippingProvider>(context);

    return shippingProvider.center == null
        ? Center(child: CircularProgressIndicator())
        : Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: shippingProvider.center!, zoom: 15),
                onMapCreated: shippingProvider.onCreate,
                /*onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },*/
                myLocationEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                rotateGesturesEnabled: true,
                markers: shippingProvider.markers,
                onCameraMove: shippingProvider.onCameraMove,
                polylines: shippingProvider.poly,
              ),
              Positioned(
                top: 10,
                left: 15,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.teal,
                          size: 20,
                        ),
                        onPressed: () {
                          scaffoldSate.currentState!.openDrawer();
                        }),
                  ),
                ),
              ),
            ],
          );
  }

  /*Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      print(lat);
      print(lng);
    }
  }*/
}
