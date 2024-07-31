import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_view.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_view.dart';

class UserGameMainWrapperView extends StatelessWidget {
  UserGameMainWrapperView({super.key});

  final UserGameMainWrapperViewModel userGameMainWrapperViewModel =
  Get.put(UserGameMainWrapperViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(67, 155, 171, 1.0),
      body: GetBuilder<UserGameMainWrapperViewModel>(
              builder: (context) {
      return PageView(
        onPageChanged: (value){
          userGameMainWrapperViewModel.changeIndex(value);
        },
        controller: userGameMainWrapperViewModel.pageController,
        children: [

          UserRegistrationUsernameView(),
          UserGameMainWrapperMiningView(),
          UserRegistrationGenderView(),

        ],);
        }
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }

  Obx CustonNavigatorBar() => Obx(
        () => ConvexAppBar(
      style: TabStyle.react,

      backgroundColor: const Color.fromRGBO(41, 41, 41, 1.0),
      activeColor: Color.fromRGBO(67, 155, 171, 1.0),
      shadowColor: Colors.blueGrey,

      items: const [
        TabItem(
          icon: Icons.shopping_cart,
          title: 'Shop',
        ),
        TabItem(icon: Icons.monetization_on_outlined, title: 'Mining',),
        TabItem(icon: Icons.business, title: 'Empire'),
      ],
      initialActiveIndex: userGameMainWrapperViewModel.selectedIndex.value,
      onTap: (value) {
        userGameMainWrapperViewModel.changeIndex(value);
      },
    ),
  );
}
