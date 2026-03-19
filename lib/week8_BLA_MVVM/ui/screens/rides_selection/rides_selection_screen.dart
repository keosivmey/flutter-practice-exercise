import 'package:flutter/material.dart';
import 'view_model/ride_selection_model.dart';
import 'package:provider/provider.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/ui/states/ride_preference_state.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/data/repositories/ride/ride_repository.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RideSelectionViewModel(
        ridePrefState: context.read<RidePreferenceState>(),
        ridesRepository: context.read<RideRepository>(),
      ),
      child: const RidesSelectionScreen(),
    );
  }
}
