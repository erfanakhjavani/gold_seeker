import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../Core/Constants/app_route.dart';
import '../../Core/Gen/assets.gen.dart';
import '../../Core/repositories/check_connectivity.dart';
import 'splash_model.dart';

class SplashViewmodel extends GetxController {
  var connectionStatus = ConnectionStatus.initial.obs;

  final SplashRepository splashRepository = SplashRepository();

  @override
  void onInit() {
    super.onInit();
    checkConnection();

  }

  Future<void> checkConnection() async {
    connectionStatus.value = ConnectionStatus.initial;
    await Future.delayed(const Duration(seconds: 2));

    bool isConnected = await splashRepository.checkConnectivity();
    if (isConnected) {
      connectionStatus.value = ConnectionStatus.connected;
      var box = await Hive.openBox('userBox');
      bool isRegistered = box.get('isRegistered', defaultValue: false);
      Get.offAllNamed(isRegistered ? AppRoute.userGameMainWrapper : AppRoute.userRegistrationLanguage);
    } else {
      connectionStatus.value = ConnectionStatus.disconnected;
    }
  }
}
