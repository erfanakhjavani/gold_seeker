import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRegistrationUsernameViewModel extends GetxController {
  var username = ''.obs;

  TextEditingController usernameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(() {
      username.value = usernameController.text;
    });
  }

  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }

  String getUserName() {
    return username.value;
  }
}
