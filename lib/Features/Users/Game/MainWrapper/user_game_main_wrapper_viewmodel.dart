


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserGameMainWrapperViewModel extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  RxString title = ''.obs;
  RxInt selectedIndex = 0.obs;
  RxInt power = 88.obs;
  var backgroundColor = const Color.fromRGBO(67, 155, 171, 1.0).obs;
  var avatarColor =   const Color.fromRGBO(243, 195, 39, 1.0).obs;
  PageController pageController = PageController(initialPage: -1);

  @override
  void onInit() {
    tabController = TabController(
      length: 4,
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
        title.value = 'G-miner';
        backgroundColor.value = const Color.fromRGBO(67, 155, 171, 1.0);
        avatarColor.value = const Color.fromRGBO(243, 195, 39, 1.0);

        break;
      case 1:
        title.value = 'Empire';
        backgroundColor.value =  const Color.fromRGBO(1, 73, 111, 1.0);
        avatarColor.value =  const Color.fromRGBO(67, 155, 171, 1.0);
        break;
      case 2:
        title.value = 'Shop';
        backgroundColor.value = const Color.fromRGBO(60, 1, 132, 1.0);
        avatarColor.value = const Color.fromRGBO(243, 39, 233, 1.0);

        break;
        case 3:
          backgroundColor.value = const Color.fromRGBO(169, 0, 0, 1.0);
          avatarColor.value = const Color.fromRGBO(166, 0, 44, 1.0);
          break;
    }
    update();
  }



  void updatePower(int newValue) {
    power.value = newValue;
  }


}
