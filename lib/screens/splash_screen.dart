import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex/controllers/splash_controller.dart';
import 'package:spacex/utils/my_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Get.put(SplashController());
    return Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset("assets/images/rocket.json"),
            ),
            Text(
              "SpaceX",
              style: TextStyle(
                fontSize: size.width * .08,
                fontWeight: FontWeight.bold,
                fontFamily: "poppins",
              ),
            )
          ],
        ));
  }
}
