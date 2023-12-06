import 'dart:html';

import 'package:geocoder2/geocoder2.dart';
import 'package:location/location.dart';

class LocationUtils {

  late double latitude;
  late double longitude;
  static LocationUtils instance = LocationUtils();

  void getLocation() async {
    Location location = Location();

    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var locationData = await location.getLocation();
    latitude = locationData.latitude!;
    longitude = locationData.longitude!;
  }

  Future<String> getAddress() async {
    var addresses = await Geocoder2.local.findAddressesFromCoordinates(Coordinates(
      latitude,
      longitude
    ));
    return addresses.first.addressLine;
  }
}