import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_model.dart';

class UserRegistrationUsernameViewModel extends GetxController {
  var username = ''.obs;
  UserRegistrationUsernameModel usernameModel = UserRegistrationUsernameModel();

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

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
  }

  String setUserName(String text) {
    return usernameModel.userName = text;
  }

  String getUserName() {
    String truncatedText = truncateWithEllipsis(30, username.value);
    return truncatedText;
  }
}