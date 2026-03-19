import 'package:bla_bla_car/week8_BLA_MVVM/ui/states/ride_preference_state.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePrefState;

  HomeViewModel({required this.ridePrefState}) {
    ridePrefState.addListener(notifyListeners);
  }

  RidePreference? get selectedPreference => ridePrefState.selectedPreference;

  List<RidePreference> get history => ridePrefState.history;

  void selectPreference(RidePreference preference) {
    ridePrefState.selectPreference(preference);
  }

  @override
  void dispose() {
    ridePrefState.removeListener(notifyListeners);
    super.dispose();
  }
}
