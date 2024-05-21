import 'package:get/get.dart';
import 'package:spacex/models/rocket_details_model.dart';
import 'package:spacex/services/api_service.dart';

class RocketsDetailsController extends GetxController {
  final String id;
  RocketsDetailsController({required this.id});
  @override
  void onInit() {
    getAllRocketsDetails();
    super.onInit();
  }

  //var
  ApiService service = ApiService();
  RxBool isLoading = false.obs;
  final rocketDetails = Rxn(RocketDetailsModel());
  //All Functions
  getAllRocketsDetails() async {
    try {
      isLoading.value = true;
      rocketDetails.value = await service.getRocketDetails(id: id);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
