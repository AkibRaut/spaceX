import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacex/models/rocket_model.dart';
import 'package:http/http.dart' as http;
import 'package:spacex/services/database_handler.dart';
import 'package:spacex/utils/apis.dart';

class ApiService {
  DBHandeler dbHandeler = DBHandeler();

//check Internet connection
  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  //fetch List of rockets fucntion here
  Future<List<RocketModel>> getAllRockets() async {
    try {
      bool isconnected = await hasNetwork();

      if (isconnected == true) {
        final uri = Uri.parse(Apis.baseurl);
        final response = await http.get(uri);
        final responseData = json.decode(response.body);
        if (responseData != null) {
          List data = responseData;
          return data.map((e) => RocketModel.fromJson(e)).toList();
        } else {
          return [];
        }
      } else {
        List<RocketModel> rocketList = await dbHandeler.readdata();

        return rocketList;
      }
    } catch (e) {
      return [];
    }
  }
}


//make access global for provider
final rocketProvider = Provider<ApiService>((ref) => ApiService());
