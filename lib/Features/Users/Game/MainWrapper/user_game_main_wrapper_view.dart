import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_colors.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';

import '../../Registration/Gender/user_registration_gender_view.dart';
import '../../Registration/UserName/user_registration_username_view.dart';
import 'Mining/user_game_main_wrapper_mining_view.dart';

class UserGameMainWrapperView extends StatelessWidget {
  UserGameMainWrapperView({super.key});

  final UserGameMainWrapperViewModel userGameMainWrapperViewModel = Get.put(UserGameMainWrapperViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueCode,
      body: GetBuilder<UserGameMainWrapperViewModel>(
          builder: (context) => PageView(
          onPageChanged: userGameMainWrapperViewModel.onPageChanged,
          controller: userGameMainWrapperViewModel.pageController,
          children: [
            UserRegistrationUsernameView(),
            UserGameMainWrapperMiningView(),
            UserRegistrationGenderView(),

          ],
        ),
      ),
      bottomNavigationBar: customNavigatorBar(),
    );
  }

  Obx customNavigatorBar() => Obx(
        () => ConvexAppBar(
      style: TabStyle.react,
      backgroundColor: const Color.fromRGBO(41, 41, 41, 1.0),
      activeColor: AppColors.blueCode,
      shadowColor: Colors.blueGrey,
      items: const [
        TabItem(
          icon: Icons.shopping_cart,
          title: 'Shop',
        ),
        TabItem(icon: Icons.monetization_on_outlined, title: 'Mining',),
        TabItem(icon: Icons.business, title: 'Empire'),
      ],
      controller: userGameMainWrapperViewModel.tabController,
      initialActiveIndex: userGameMainWrapperViewModel.selectedIndex.value,
      onTap: (int value) {
        userGameMainWrapperViewModel.changeTabIndex(value);
      },
    ),
  );
}
