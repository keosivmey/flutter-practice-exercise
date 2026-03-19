import 'package:bla_bla_car/week8_BLA_MVVM/model/ride/locations.dart';

abstract class LocationRepository {
  Future<List<Location>> getLocations();
}
