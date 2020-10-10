import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:getx_app/http/request.dart';
import 'package:getx_app/http/url.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    print("circluar running");

    Request request = Request(url: urlLogin, body: {
      'email': emailTextController,
      'password': passwordTextController,
    });

    print("email pass sent to request");

    request.post().then((value) {
      print("value recieved by post");

      Get.back();
      Get.offNamed('/homeView');
    }).catchError((onError) {});
  }
}
