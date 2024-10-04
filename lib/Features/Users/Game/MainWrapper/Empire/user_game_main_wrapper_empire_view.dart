import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Gen/assets.gen.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_model.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_viewmodel.dart';
import '../../../Registration/UserName/user_registration_username_viewmodel.dart';
import '../user_game_main_wrapper_viewmodel.dart';

class UserGameMainWrapperEmpireView extends GetView<UserGameMainWrapperEmpireViewModel> {
  UserGameMainWrapperEmpireView({super.key});



  final List<UserGameMainWrapperEmpireModel> userModel = [
    UserGameMainWrapperEmpireModel(
      imageLevel: Assets.jpg.background.provider(),
      name: 'x',
      genderAvatar: Assets.webp.woman.provider(),
      color: Colors.orange,
      power: 90,
      isLocked: false,
    ),
    UserGameMainWrapperEmpireModel(
      imageLevel: Assets.jpg.backSky.provider(),
      name: 'y',
      genderAvatar: Assets.webp.man.provider(),
      color: Colors.blueAccent,
      power: 50,
      isLocked: false,
    ),
    UserGameMainWrapperEmpireModel(
      imageLevel: Assets.jpg.backgroudGame.provider(),
      name: 'z',
      genderAvatar: Assets.png.hatter.provider(),
      color: Colors.black87,
      power: 12,
      isLocked: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.find<UserGameMainWrapperViewModel>().backgroundColor.value,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.jpg.backSky.provider(),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            const Center(
              child: SpinningWheelWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: userModel.length,
                itemBuilder: (context, index) {
                  controller.updatePower(userModel[index].power);
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!userModel[index].isLocked) {
                            final viewModel = Get.find<UserGameMainWrapperViewModel>();
                            final usernameModel = Get.find<UserRegistrationUsernameViewModel>();
                            viewModel.pageController.jumpToPage(0);
                            viewModel.tabController.animateTo(0);
                            viewModel.changeAvatar(userModel[index].genderAvatar);
                            usernameModel.setUserName(userModel[index].name);
                            viewModel.changeBackgroundGame(userModel[index].imageLevel);
                            usernameModel.onInit();
                          }
                        },
                        child: Opacity(
                          opacity: userModel[index].isLocked ? 0.6 : 1.0,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            width: Get.width * .9,
                            height: Get.height / 8,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                  194, 194, 194, 0.6705882352941176),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                if (userModel[index].isLocked)
                                  const Center(
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black54,
                                      size: 50,
                                    ),
                                  ),
                                firstOfRow(index: index),
                                secondOfRow(index: index),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                    ],
                  );
                },
              ).animate().fadeIn(),
            ),
          ],
        ),
      ).animate().fadeIn(),
    );
  }

  Widget firstOfRow({required int index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 90,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: userModel[index].imageLevel,
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(109),
              bottomRight: Radius.circular(134),
              topLeft: Radius.circular(170),
              topRight: Radius.circular(170),
            ),
          ),
        ),
        if (!userModel[index].isLocked)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2, left: 18),
              child: SizedBox(
                width: Get.width / 4,
                height: 50,
                child: Stack(
                  children: [
                    Container(
                      width: Get.width / 6,
                      height: Get.height / 25,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        color: userModel[index].color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6, top: 9, left: 30.0),
                        child: Assets.png.iconUp.image(),
                      ),
                    ),
                    Container(
                      width: Get.width / 11.5,
                      height: Get.height / 25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: userModel[index].genderAvatar,
                        ),
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
          ),
        if (!userModel[index].isLocked)
          Text(
            userModel[index].name,
            style: Get.textTheme.bodyLarge?.copyWith(
              fontSize: 12,
              letterSpacing: 1,
              color: Colors.black87,
            ),
          ),
      ],
    );
  }

  Widget secondOfRow({required int index}) {
    return !userModel[index].isLocked
        ? Padding(
      padding: const EdgeInsets.only(top: 55.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width / 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Power',
                        style: Get.textTheme.labelSmall?.copyWith(
                          color: const Color.fromRGBO(28, 28, 28, 1.0),
                        ),
                      ),
                      Text(
                        '${userModel[index].power}/',
                        style: Get.textTheme.labelSmall?.copyWith(
                          color: const Color.fromRGBO(253, 253, 253, 1.0),
                        ),
                      ),
                      Text(
                        '100',
                        style: Get.textTheme.labelSmall?.copyWith(
                          color: const Color.fromRGBO(0, 0, 0, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                LinearProgressIndicator(
                  backgroundColor: const Color.fromRGBO(68, 109, 124, 1.0),
                  value: controller.power.value / 100,
                  minHeight: 5,
                  color: const Color.fromRGBO(20, 225, 61, 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        : const SizedBox.shrink();
  }
}

class SpinningWheelWidget extends StatelessWidget {
  const SpinningWheelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(UserGameMainWrapperEmpireViewModel());
    return SingleChildScrollView(
      child: RotationTransition(
        turns: viewModel.animation,
        child: Assets.png.erth.image(width: Get.width, height: 500),
      ),
    );
  }
}
