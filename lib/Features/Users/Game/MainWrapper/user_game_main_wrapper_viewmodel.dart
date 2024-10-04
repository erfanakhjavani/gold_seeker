import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Gen/assets.gen.dart';

class UserGameMainWrapperViewModel extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  RxString title = 'Gold Seeker'.obs;
  RxInt selectedIndex = 0.obs;
  RxInt power = 88.obs;
  var backgroundColor = const Color.fromRGBO(126, 126, 126, 0.9294117647058824).obs;
  var avatarColor = const Color.fromRGBO(243, 195, 39, 1.0).obs;
  var avatar = Assets.png.girl.provider().obs;
  var backgroundGame = Assets.jpg.backgroudGame.provider().obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();  // ابتدا متد والد اجرا شود
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 300),
    );
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();  // مدیریت بهتر منابع
    super.onClose();
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
    changeTabIndex(index);
  }

  void changeTabIndex(int index) {
    tabController.animateTo(index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    updateBackgroundColor(index);
  }

  void updateBackgroundColor(int index) {
    switch (index) {
      case 0:
        title.value = 'G-miner';
        backgroundColor.value = const Color.fromRGBO(161, 161, 161, 0.9294117647058824);
        avatarColor.value = const Color.fromRGBO(243, 195, 39, 1.0);
        break;
      case 1:
        title.value = 'Empire';
        backgroundColor.value = const Color.fromRGBO(1, 73, 111, 1.0);
        avatarColor.value = const Color.fromRGBO(67, 155, 171, 1.0);
        break;
      case 2:
        title.value = 'Shop';
        backgroundColor.value = const Color.fromRGBO(60, 1, 132, 1.0);
        avatarColor.value = const Color.fromRGBO(243, 39, 233, 1.0);
        break;
      case 3:
        title.value = 'Profile';
        backgroundColor.value = const Color.fromRGBO(169, 0, 0, 1.0);
        avatarColor.value = const Color.fromRGBO(166, 0, 44, 1.0);
        break;
    }
    update();  // فقط زمانی که واقعاً تغییرات رخ داده آپدیت کنید
  }

  void changeAvatar(ImageProvider provider, {Duration? delay}) {
    Future.delayed(delay ?? const Duration(milliseconds: 0), () {
      avatar.value = provider;
    });
  }

  void changeBackgroundGame(ImageProvider provider, {Duration? delay}) {
    Future.delayed(delay ?? const Duration(milliseconds: 0), () {
      backgroundGame.value = provider;
    });
  }

  void updatePower(int newValue) {
    power.value = newValue;
  }
}
