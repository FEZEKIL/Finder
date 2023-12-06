import 'package:flutter/material.dart';
import 'package:finder/core/utils/location_utils.dart';
import 'package:finder/injector.dart';

class LocationProvider extends ChangeNotifier {
  //* ----------------------------
  //* This is side for property data
  //* ----------------------------

  //* Location Address
  late String _address;
  String get address => _address;

  //* Location Coordinate
  late double _latitude;
  double get latitude => _latitude;
  late double _longitude;
  double get longitude => _longitude;

  //* Dependency Injection
  LocationUtils locationUtils = locator<LocationUtils>();

  //* ----------------------------
  //* Function field
  //* ----------------------------

  /// Function to load location from GPS and address
  void loadLocation() async {
    locationUtils.getLocation();

    _address = await locationUtils.getAddress();
    _latitude = locationUtils.latitude;
    _longitude = locationUtils.longitude;
    notifyListeners();
  }
}