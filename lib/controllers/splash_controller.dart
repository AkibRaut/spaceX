import 'package:get/get.dart';
import 'package:spacex/screens/rockets_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    showsplash();
    super.onInit();
  }

  showsplash() {
    try {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAll(const RocketsScreen()));
    } catch (e) {
      //
    }
  }
}
