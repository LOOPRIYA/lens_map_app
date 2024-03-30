import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:lens_map_app/model/user_model.dart';
import 'package:lens_map_app/server_routes.dart';
import 'package:latlong2/latlong.dart';

UserModel user =
    const UserModel(email: '', uid: '', name: '', freelancer: 0, balance: 0);

class UserController extends GetxController {
  Rx<Marker> marker =
      const Marker(point: LatLng(0, 0), child: Icon(Icons.add_location)).obs;
  Rx<LatLng> lat = const LatLng(0,0).obs;
  Dio dio = Dio();
  RxList myLocations = [].obs;
  Rx<UserModel> userModel = const UserModel(
          email: '', uid: '', name: '', freelancer: false, balance: 0)
      .obs;

  Future<int> login(String email, String password) async {
    final response = await dio.post('${ServerRoutes.host}/login', data: {
      'email': email.toString(),
      'password': password.toString(),
    });
    var data = jsonDecode(response.data);
    print(data);
    if (data['success'] == false) {
      return -1;
    } else {
      user = UserModel(
          email: data['email'],
          uid: data['uid'],
          name: data['name'],
          balance: double.parse(data['balance']),
          freelancer: data['freelancer']);
      userModel.value = UserModel(
          email: data['email'],
          uid: data['uid'],
          name: data['name'],
          balance: double.parse(data['balance']),
          freelancer: data['freelancer']);
      return int.parse(data['uid']);
    }
  }

  Future<void> getMyLocations() async {
    final response = await dio
        .get('${ServerRoutes.host}/myLocations?uid=${userModel.value.uid}');
    myLocations.value = jsonDecode(response.data);
  }

  RxList days = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  RxList<TimeModel> hours = [
    const TimeModel(title: '00:00', time: 100),
    const TimeModel(title: '01:00', time: 101),
    const TimeModel(title: '02:00', time: 102),
    const TimeModel(title: '03:00', time: 103),
    const TimeModel(title: '04:00', time: 104),
    const TimeModel(title: '05:00', time: 105),
    const TimeModel(title: '06:00', time: 106),
    const TimeModel(title: '07:00', time: 107),
    const TimeModel(title: '08:00', time: 108),
    const TimeModel(title: '09:00', time: 109),
    const TimeModel(title: '10:00', time: 110),
    const TimeModel(title: '11:00', time: 111),
    const TimeModel(title: '12:00', time: 112),
    const TimeModel(title: '13:00', time: 113),
    const TimeModel(title: '14:00', time: 114),
    const TimeModel(title: '15:00', time: 115),
    const TimeModel(title: '16:00', time: 116),
    const TimeModel(title: '17:00', time: 117),
    const TimeModel(title: '18:00', time: 118),
    const TimeModel(title: '19:00', time: 119),
    const TimeModel(title: '20:00', time: 120),
    const TimeModel(title: '21:00', time: 121),
    const TimeModel(title: '22:00', time: 122),
    const TimeModel(title: '23:00', time: 123),
  ].obs;
  RxInt startTime = 0.obs;
  RxInt endTime = 0.obs;

  void setStartTime(int time) {
    startTime.value = time;
    notifyChildrens();
  }

  void setEndTime(int time) {
    endTime.value = time;
    notifyChildrens();
  }

  void setMn(index) {
    days.value[index] = !days.value[index];
    days.refresh();
    notifyChildrens();
  }

  void changePoint(newPoint,geo) {
    marker.value = newPoint;
    lat.value = geo;
    notifyChildrens();
  }
  Future<void> createService(price, title, geo_x, geo_y) async {
    await dio.post('${ServerRoutes.host}/locations',
    data: {
      'uid': userModel.value.uid,
      'geo_x': geo_x.toString(),
      'geo_y': geo_y.toString(),
      'title': title,
      'price': price,
    });
  }
}

class TimeModel {
  final int time;
  final String title;
  const TimeModel({required this.title, required this.time});
}
