


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserGameMainWrapperViewModel extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 1.obs;
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

  void changeTabIndex(int index) {
    tabController.animateTo(index);
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    selectedIndex.value = index;
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
    tabController.animateTo(index);
  }
}