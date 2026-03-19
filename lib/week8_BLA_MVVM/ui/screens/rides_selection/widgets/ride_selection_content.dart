import 'package:bla_bla_car/week8_BLA_MVVM/model/ride_pref/ride_pref.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/ui/screens/rides_selection/view_model/ride_selection_model.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';

class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mv = context.watch<RideSelectionViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: mv.selectedPreference!,
              onBackPressed: () => Navigator.pop(context),
              onFilterPressed: () {},
              onPreferencePressed: () => _onPreferencePressed(context, mv),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: mv.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: mv.matchingRides[index],
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPreferencePressed(
    BuildContext context,
    RideSelectionViewModel mv,
  ) async {
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: mv.selectedPreference!),
          ),
        );

    if (newPreference != null) {
      mv.selectPreference(newPreference);
    }
  }
}
