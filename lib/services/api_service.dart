import 'dart:convert';
import 'package:get/get.dart';
import 'package:spacex/models/rocket_details_model.dart';
import 'package:spacex/models/rocket_model.dart';
import 'package:http/http.dart' as http;
import 'package:spacex/utils/apis.dart';
import 'package:spacex/utils/my_colors.dart';

class ApiService {
  //fetch List of rockets fucntion here
  Future<List<RocketModel>> getAllRockets() async {
    try {
      final uri = Uri.parse(Apis.baseurl);
      final response = await http.get(uri);
      final responseData = json.decode(response.body);
      if (responseData != null) {
        List data = responseData;
        return data.map((e) => RocketModel.fromJson(e)).toList();
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //fetch details of rockets fucntion here from id of rocket

  Future<RocketDetailsModel> getRocketDetails({required String id}) async {
    try {
      final uri = Uri.parse("${Apis.rocketsDetailsApi}/$id");
      final response = await http.get(uri);
      final responseData = json.decode(response.body);
      if (responseData != null) {
        RocketDetailsModel rocketDetailsModel =
            RocketDetailsModel.fromJson(responseData);
        return rocketDetailsModel;
      } else {
        Get.snackbar("", responseData["message"].toString(),
            backgroundColor: MyColors.blackColor,
            colorText: MyColors.whiteColor);
        return RocketDetailsModel();
      }
    } catch (e) {
      return RocketDetailsModel();
    }
  }
}
