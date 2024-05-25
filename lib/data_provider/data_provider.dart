import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacex/models/rocket_model.dart';
import 'package:spacex/screens/rockets_screen.dart';
import 'package:spacex/services/api_service.dart';
import 'package:spacex/services/database_handler.dart';

DBHandeler dbHandeler = DBHandeler();
//get All Rocket List
final rocketDataProvier = FutureProvider<List<RocketModel>>((ref) async {
  return ref.watch(rocketProvider).getAllRockets();
});
final internetProvider = FutureProvider<bool>((ref) async {
  return ref.watch(rocketProvider).hasNetwork();
});
//Show splash Screen and navigate to home screen after 3 seconds
final splashScreenProvider =
    StateNotifierProvider<SplashScreenNotifier, bool>((ref) {
  dbHandeler.databasseCreate();
  return SplashScreenNotifier();
});


//splash screen function for show splash screen 3 seconds
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
