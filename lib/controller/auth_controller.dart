import 'package:get/get.dart';
import 'package:lens_map_app/model/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel(email: '', uid: '', name: '').obs;
  Future<void> auth() async {

  }
}