import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/location/location_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/model/ride/locations.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/dummy_data.dart';

class LocationRepositoryMock extends LocationRepository {
  
  @override
  List<Location> getLocations() {
    return fakeLocations;
  }
}
