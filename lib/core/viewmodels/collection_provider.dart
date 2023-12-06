import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finder/core/models/collection_model.dart';
import 'package:finder/core/services/collection/collection_services.dart';
import 'package:finder/core/viewmodels/location_provider.dart';
import 'package:finder/core/viewmodels/restaurant_provider.dart';
import 'package:finder/injector.dart';
import 'package:finder/ui/router/router_generator.dart';

class CollectionProvider extends ChangeNotifier {
  //* ----------------------------
  //* This is side for property data
  //* ----------------------------

  //* Collection list variable
  late List<CollectionModel> _collectionList;
  List<CollectionModel> get collectionList => _collectionList;

  //* Dependency Injection
  CollectionServices collectionServices = locator<CollectionServices>();

  //* ----------------------------
  //* Function field
  //* ----------------------------

  /// Function to get all collection in jakarta
  void getAll(BuildContext context) async {
    final locationProv = Provider.of<LocationProvider>(context, listen: false);
    _collectionList = await collectionServices.getAll(
      locationProv.latitude.toString(), locationProv.longitude.toString(),
      context);
    notifyListeners();
  }

  /// Function to navigate to restaurant list by collection
  void goToRestaurantList(CollectionModel collection, BuildContext context) async {
    Provider.of<RestaurantProvider>(context, listen: false).clearRestaurantByCollection();
    Navigator.pushNamed(context, RouterGenerator.routeRestaurantByCollection,
      arguments: collection);
  }
}