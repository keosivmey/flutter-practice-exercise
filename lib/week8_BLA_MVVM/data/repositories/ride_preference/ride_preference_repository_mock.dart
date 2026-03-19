import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {
  final List<RidePreference> _history = [];

  @override
  List<RidePreference> getHistory() => _history;

  @override
  void addToHistory(RidePreference preference) {
    _history.add(preference);
  }
}
