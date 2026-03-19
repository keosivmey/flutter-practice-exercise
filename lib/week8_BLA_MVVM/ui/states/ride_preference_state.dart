import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';
import 'package:flutter/widgets.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreferenceState({required this.repository});

  RidePreference? _selectedPreference;

  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get history => repository.getHistory();

  //select a new ride preference and add it to history
  void selectPreference(RidePreference preference) {
    if (_selectedPreference != preference) {
      _selectedPreference = preference;

      repository.addToHistory(preference);
      notifyListeners();
    }
  }
}

