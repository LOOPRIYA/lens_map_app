import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lens_map_app/controller/auth_controller.dart';
import 'package:lens_map_app/model/request_model.dart';
import 'package:lens_map_app/server_routes.dart';

class RequestController extends GetxController {
  Dio dio = Dio();
  final requests = Rx<List<RequestModel>>([]);
  Future<void> getMyRequests() async {
    final response =
        await dio.get("${ServerRoutes.host}/requests?uid=${user.uid}");
    List reviewsData = jsonDecode(response.data);
    for (var item in reviewsData) {
      requests.value.add(RequestModel(
          uid: item['uid'],
          id: item['id'],
          price: item['price'],
          cid: item['cid'],
          reviewCustomer: item['review_customer'],
          reviewFreelancer: item['review_freelancer'],
          approveCustomer: item['approve_customer'],
          approveFreelancer: item['approve_freelancer']));
    }
  }

  Future<void> sendRequest({
    required cid,
    required freelancerUid,
  }) async {
    dio.post("${ServerRoutes.host}/requests", data: {
      'uid': user.uid.toString(),
      'cid': cid.toString(),
      'freelancer_uid': freelancerUid.toString(),
    });
  }
}
