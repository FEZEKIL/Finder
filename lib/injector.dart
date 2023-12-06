import 'package:get_it/get_it.dart';
import 'package:finder/core/services/collection/collection_services.dart';
import 'package:finder/core/services/restaurant/restaurant_services.dart';
import 'package:finder/core/services/review/review_services.dart';
import 'package:finder/core/utils/location_utils.dart';

GetIt locator = GetIt.instance;
void setupLocator() async {

  //* Register as singleton
  await locator.registerSingleton(CollectionServices());
  await locator.registerSingleton(RestaurantServices());
  await locator.registerSingleton(ReviewServices());
  await locator.registerSingleton(LocationUtils());
}
