import 'package:bla_bla_car/week8_BLA_MVVM/ui/screens/home/view_model/home_model.dart';
import 'package:bla_bla_car/week8_BLA_MVVM/ui/screens/home/widgets/home_content.dart';
import 'package:flutter/material.dart';
import '/week8_BLA_MVVM/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeViewModel(ridePrefState: context.read<RidePreferenceState>()),
      child: const HomeContent(),
    );
  }
}
