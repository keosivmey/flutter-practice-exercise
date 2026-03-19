import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/model/ride_pref/ride_pref.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/dummy_data.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {

  @override
  Future<List<RidePreference>> getRidePreference() async {
    await Future.delayed(Duration(seconds: 2));
    return fakeRidePrefs;
  }
}

