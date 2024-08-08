import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'user_registration_username_model.dart';

class UserRegistrationUsernameViewModel extends GetxController {
  var username = ''.obs;
  UserRegistrationUsernameModel usernameModel = UserRegistrationUsernameModel();

  late Box<UserRegistrationUsernameModel> usernameBox;

  TextEditingController usernameController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    await Hive.openBox<UserRegistrationUsernameModel>('usernameBox');
    usernameBox = Hive.box<UserRegistrationUsernameModel>('usernameBox');

    if (usernameBox.isNotEmpty) {
      username.value = usernameBox.getAt(0)?.userName ?? '';
      usernameModel = usernameBox.getAt(0)!;
      usernameController.text = usernameModel.userName ?? '';
    }

    usernameController.addListener(() {
      username.value = usernameController.text;
    });
  }

  @override
  void onClose() {
    usernameController.dispose();
    usernameBox.close();
    super.onClose();
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
  }

  String setUserName(String text) {
    usernameModel.userName = text;

    // ذخیره نام کاربری در Hive
    if (usernameBox.isEmpty) {
      usernameBox.add(usernameModel);
    } else {
      usernameBox.putAt(0, usernameModel);
    }

    return usernameModel.userName!;
  }

  String getUserName() {
    String truncatedText = truncateWithEllipsis(30, username.value);
    return truncatedText;
  }
}
