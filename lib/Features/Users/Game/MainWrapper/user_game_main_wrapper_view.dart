import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gs/Core/Constants/app_colors.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Profile/user_game_main_wrapper_profile_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Shop/user_game_main_wrapper_shop_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_widget.dart';
import '../../../../Core/Widgets/button_widgets.dart';
import '../../Registration/UserName/user_registration_username_viewmodel.dart';

class UserGameMainWrapperView extends GetView<UserGameMainWrapperViewModel> {
  UserGameMainWrapperView({super.key});

  final UserRegistrationUsernameViewModel usernameViewModel =
      Get.put(UserRegistrationUsernameViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
      child: Scaffold(
            backgroundColor: controller.backgroundColor.value,
            body: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height / 4.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black,
                        controller.backgroundColor.value,
                      ],
                    ),
                  ),
                  child: SizedBox(
                    child: Wrap(
                      children: [
                        customAppBar(
                          text: controller.selectedIndex.value != 3
                              ?controller.title.value  :usernameViewModel.username.value,
                          color: Colors.white,
                          actions:controller.selectedIndex.value == 3 ? [] : [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.gear),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        firstOfRow(
                          image: controller.avatar.value,
                            userRegistration: usernameViewModel,
                            color: controller.avatarColor.value,
                            index: controller.selectedIndex.value
                        ),
                        secondOfRow(
                            userGameMainWrapperViewModel: controller,
                            index: controller.selectedIndex.value)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GetBuilder<UserGameMainWrapperViewModel>(
                    builder: (context) => PageView(
                      onPageChanged: controller.onPageChanged,
                      controller: controller.pageController,
                      children: [
                        UserGameMainWrapperMiningView(),
                        UserGameMainWrapperEmpireView(),
                        UserGameMainWrapperShopView(),
                        UserGameMainWrapperProfileView(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: customNavigatorBar(),
          ),
    ));
  }

  Obx customNavigatorBar() => Obx(
        () => ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: const Color.fromRGBO(41, 41, 41, 1.0),
          activeColor: AppColors.blueCode,
          shadowColor: Colors.blueGrey,
          items: const [
            TabItem(icon: Icons.monetization_on_outlined, title: 'Mining'),
            TabItem(icon: Icons.business, title: 'Empire'),
            TabItem(icon: Icons.shopping_cart, title: 'Shop',),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          controller: controller.tabController,
          initialActiveIndex: controller.selectedIndex.value,
          onTap: (int value) {
            controller.changeTabIndex(value);
          },
        ),
      );
}
