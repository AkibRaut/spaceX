import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacex/models/rocket_details_model.dart';
import 'package:spacex/models/rocket_model.dart';
import 'package:spacex/screens/rockets_screen.dart';
import 'package:spacex/services/api_service.dart';

//get All Rocket List
final rocketDataProvier = FutureProvider<List<RocketModel>>((ref) async {
  return ref.watch(rocketProvider).getAllRockets();
});

//get Rocket Details From Rocket List
final rocketDetailsProviser =
    StreamProvider.family<RocketDetailsModel, String>((ref, id) {
  return ref.watch(rocketProvider).getRocketDetails(id: id).asStream();
});

//Show splash Screen and navigate to home screen after 3 seconds
final splashScreenProvider =
    StateNotifierProvider<SplashScreenNotifier, bool>((ref) {
  return SplashScreenNotifier();
});

class SplashScreenNotifier extends StateNotifier<bool> {
  SplashScreenNotifier() : super(false);
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      state = true;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const RocketsScreen()),
      );
    });
  }
}
