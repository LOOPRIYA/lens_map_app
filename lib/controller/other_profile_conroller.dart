import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lens_map_app/server_routes.dart';

class OtherProfileController extends GetxController {
  RxMap userData = {}.obs;
  RxList service = [].obs;
  RxList reviews = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getUserData(1);
    super.onInit();
  }

  Dio dio = Dio();

  Future<void> getUserData(uid) async {
    final response = await dio.get("${ServerRoutes.host}/profile?uid=$uid");
    final data = jsonDecode(response.data);
    userData.value = data;
    service.value = data['offers'];
    reviews.value = data['reviews'];
    notifyChildrens();
    print(service);
  }
}
