
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class UserGameMainWrapperEmpireViewModel extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var power = 88.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 2),
    )..repeat();
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );
  }

  void updatePower(int newValue) {
    power.value = newValue;
    update();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}