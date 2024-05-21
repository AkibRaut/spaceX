import 'package:get/get.dart';
import 'package:spacex/models/rocket_model.dart';
import 'package:spacex/services/api_service.dart';

class RocketsController extends GetxController {
  @override
  void onInit() {
    getAllRockets();
    super.onInit();
  }

  //var
  ApiService service = ApiService();
  RxList<RocketModel> rocketList = <RocketModel>[].obs;
  RxBool isLoading = false.obs;

  //All Functions
  getAllRockets() async {
    try {
      isLoading.value = true;
      rocketList.value = await service.getAllRockets();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      //
    }
  }
}
