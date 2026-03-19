import 'package:flutter/material.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/model/ride/ride.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride/ride_repository.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/ui/states/ride_preference_state.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/model/ride_pref/ride_pref.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePrefState;
  final RideRepository ridesRepository;

  RideSelectionViewModel({
    required this.ridePrefState,
    required this.ridesRepository,
  }) {
    ridePrefState.addListener(notifyListeners);
  }

  RidePreference get selectedPreference => ridePrefState.selectedPreference!;

  List<Ride> get matchingRides => ridesRepository.getRides();

  void selectPreference(RidePreference preference) {
    ridePrefState.selectPreference(preference);
  }

  @override
  void dispose() {
    ridePrefState.removeListener(notifyListeners);
    super.dispose();
  }
}
