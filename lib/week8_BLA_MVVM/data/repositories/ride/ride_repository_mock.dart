import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride/ride_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/model/ride/ride.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/dummy_data.dart';

class RideRepositoryMock extends RideRepository {
  @override
  List<Ride> getRides() {
    return fakeRides;
  }
}
