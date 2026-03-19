import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/location/location_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride/ride_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/location/location_repository_mock.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride/ride_repository_mock.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'main_common.dart';

// provider dependencies
List<SingleChildWidget> get devProviders {
  return [
    //location repository
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),

    //ride repository
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),

    //ride preference repository
    Provider<RidePreferenceRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
