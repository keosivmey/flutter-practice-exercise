import 'package:bla_bla_car/week8_BLA_MVVM/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  List<RidePreference> getHistory();
  void addToHistory(RidePreference preference);
}
