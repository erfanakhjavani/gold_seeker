


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserGameMainWrapperViewModel extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  RxString title = ''.obs;
  var selectedIndex = 1.obs;
  var power = 88.obs;
  var backgroundColor = const Color.fromRGBO(67, 155, 171, 1.0).obs;
  var avatarColor =   const Color.fromRGBO(243, 195, 39, 1.0).obs;
  PageController pageController = PageController(initialPage: 1);

  @override
  void onInit() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
      animationDuration: const Duration(milliseconds: 300),
    );
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
    tabController.animateTo(index);
    updateBackgroundColor(index);
  }

  void changeTabIndex(int index) {
    tabController.animateTo(index);
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    selectedIndex.value = index;
    updateBackgroundColor(index);
  }

  void updateBackgroundColor(int index) {
    switch (index) {
      case 0:
        backgroundColor.value = const Color.fromRGBO(87, 0, 169, 1.0);
        title.value = 'Shop';
        avatarColor.value = const Color.fromRGBO(151, 39, 243, 1.0);
        break;
      case 1:
        backgroundColor.value = const Color.fromRGBO(67, 155, 171, 1.0);
        title.value = 'Mining';
        avatarColor.value = const Color.fromRGBO(243, 195, 39, 1.0);
        break;
      case 2:
        backgroundColor.value =  const Color.fromRGBO(1, 73, 111, 1.0);
        title.value = 'Empire';
        avatarColor.value =  const Color.fromRGBO(67, 155, 171, 1.0);
        break;
    }
    update();
  }



  void updatePower(int newValue) {
    power.value = newValue;
  }


}
