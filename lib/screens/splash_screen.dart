// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex/data_provider/data_provider.dart';
import 'package:spacex/screens/rockets_screen.dart';
import 'package:spacex/utils/my_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(splashScreenProvider.notifier).startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset("assets/images/rocket.json"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RocketsScreen(),
                    ));
              },
              child: Text(
                "SpaceX",
                style: TextStyle(
                  fontSize: size.width * .08,
                  fontWeight: FontWeight.bold,
                  fontFamily: "poppins",
                ),
              ),
            )
          ],
        ));
  }
}
