

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserGameMainWrapperViewModel extends GetxController{
  var selectedIndex = 1.obs;
  var pageController = PageController(initialPage: 1);

  void changeIndex(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
    update();
  }


}