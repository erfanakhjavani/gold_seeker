import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gs/Core/Constants/app_colors.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Profile/user_game_main_wrapper_profile_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Shop/user_game_main_wrapper_shop_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';
import '../../../../Core/Gen/assets.gen.dart';
import '../../../../Core/Widgets/button_widgets.dart';
import '../../Registration/UserName/user_registration_username_viewmodel.dart';

class UserGameMainWrapperView extends GetView<UserGameMainWrapperViewModel> {
  UserGameMainWrapperView({super.key});

  final UserRegistrationUsernameViewModel usernameViewModel =
      Get.put(UserRegistrationUsernameViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
                child: Column(
                  children: [
                    customAppBar(
                      text: controller.selectedIndex.value == 3
                          ? usernameViewModel.username.value : controller.title.value,
                      color: Colors.white,
                      actions: [
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
                        userRegistration: usernameViewModel,
                        color: controller.avatarColor.value,
                        index: controller.selectedIndex.value),
                    secondOfRow(
                        userGameMainWrapperViewModel: controller,
                        index: controller.selectedIndex.value)
                  ],
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

  Row firstOfRow(
      {required UserRegistrationUsernameViewModel userRegistration,
      required Color color,
      required int index}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 18),
          child: SizedBox(
            width: Get.width / 4,
            height: 50,
            child: Stack(
              children: [
                Container(
                  width: Get.width / 4.2,
                  height: Get.height / 20,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: color,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 6, top: 9, left: 42.0),
                    child: Assets.png.iconUp.image(),
                  ),
                ),
                Container(
                  width: Get.width / 8.5,
                  height: Get.height / 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    image: DecorationImage(image: Assets.png.girl.provider()),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  usernameViewModel.getUserName(),
                  // استفاده از ویو مدل نام کاربری
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ).animate().fadeIn();
            } else if (index == 3) {
              return firstOfColumnProfile(followers: 50, friends: 10, miner: 4);
            }
            return const SizedBox.shrink();
          }),
        ),
      ],
    );
  }

  Row secondOfRow(
      {required UserGameMainWrapperViewModel userGameMainWrapperViewModel,
      required int index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10),
          child: SizedBox(
            height: 50,
            width: Get.width / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Power',
                          style: Get.textTheme.bodySmall?.copyWith(
                              color: const Color.fromRGBO(183, 226, 171, 1.0)),
                        ),
                        Wrap(
                          children: [
                            Text(
                              '${userGameMainWrapperViewModel.power.value}/',
                              style: Get.textTheme.bodySmall?.copyWith(
                                  letterSpacing: 1,
                                  color:
                                      const Color.fromRGBO(183, 226, 171, 1.0)),
                            ),
                            Text(
                              '100',
                              style: Get.textTheme.bodySmall?.copyWith(
                                  letterSpacing: 1,
                                  color:
                                      const Color.fromRGBO(20, 225, 37, 1.0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //* power linearIndicator exmp: 24/100
                Obx(
                  () => LinearProgressIndicator(
                    backgroundColor: const Color.fromRGBO(119, 124, 68, 1.0),
                    value: userGameMainWrapperViewModel.power.value / 100,
                    minHeight: 2,
                    color: const Color.fromRGBO(20, 225, 37, 1.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 20),
          child: Container(
            width: Get.width / 2.2,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(67, 155, 171, 0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(5),
                const FaIcon(
                  FontAwesomeIcons.dollarSign,
                  size: 20,
                  color: Color.fromRGBO(244, 186, 43, 1.0),
                ),
                const Gap(5),
                const VerticalDivider(
                  color: Colors.grey,
                  indent: 8,
                  endIndent: 8,
                ),
                const Gap(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profit',
                      style: Get.textTheme.labelLarge?.copyWith(
                          color: Colors.grey,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.coins,
                          color: Color.fromRGBO(190, 150, 28, 1.0),
                          size: 10,
                        ),
                        Text(
                          ' + 1800/ h',
                          style: Get.textTheme.labelSmall,
                        )
                      ],
                    )
                  ],
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  indent: 8,
                  endIndent: 8,
                ),
                const Gap(5),
                const FaIcon(
                  FontAwesomeIcons.gears,
                  color: Colors.white,
                  size: 20,
                ),
                const Gap(5),
              ],
            ),
          ),
        )
      ],
    );
  }
}
