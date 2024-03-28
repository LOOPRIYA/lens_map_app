import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lens_map_app/controller/auth_controller.dart';
import 'package:lens_map_app/server_routes.dart';

class ServicesController extends GetxController {
  Dio dio = Dio();
  RxList locations = [].obs;
  Future<void> getLocations() async {
    final response = await dio.get('${ServerRoutes.host}/locations');
    locations.value = jsonDecode(response.data);
  }
}