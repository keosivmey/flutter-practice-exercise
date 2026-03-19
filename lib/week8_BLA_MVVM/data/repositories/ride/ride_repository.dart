import 'package:bla_bla_car/week8_BLA_MVVM/model/ride/ride.dart';

abstract class RideRepository {
  Future<List<Ride>> getLocations();
}
