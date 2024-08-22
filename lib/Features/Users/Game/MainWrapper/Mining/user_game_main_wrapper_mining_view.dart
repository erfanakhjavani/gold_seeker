import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';
import '../../../../../Core/Gen/assets.gen.dart';

class UserGameMainWrapperMiningView extends StatelessWidget {
  UserGameMainWrapperMiningView({super.key});

  final UserGameMainWrapperMiningViewModel userGameMainWrapperMiningViewModel =
  Get.put(UserGameMainWrapperMiningViewModel());

  final UserGameMainWrapperViewModel userGameMainWrapperViewModel =
  Get.put(UserGameMainWrapperViewModel());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userGameMainWrapperViewModel.backgroundColor.value,
      body: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: userGameMainWrapperViewModel.backgroundGame.value,
                  fit: BoxFit.cover),

              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Obx(
                            () => GestureDetector(
                          onTap: () {
                            userGameMainWrapperMiningViewModel.addTwoHours();
                          },
                          child: MiniContainer(
                            image: Assets.png.craft.path,
                            primaryText: 'Energy',
                            secondText:
                            userGameMainWrapperMiningViewModel.countdown.value,
                          ).animate().flip(delay: 200.ms),
                        ),
                      ),
                      MiniContainer(
                        image: Assets.png.craft.path,
                        primaryText: 'Level 8',
                      ).animate().flip(delay: 300.ms),
                      MiniContainer(
                        image: Assets.png.shovel.path,
                        primaryText: 'Level 4',
                      ).animate().flip(delay: 400.ms),
                      MiniContainer(
                        image: Assets.png.hatter.path,
                        primaryText: 'Level 10',
                      ).animate().flip(delay: 500.ms),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(),

    ).animate();
  }
}

class MiniContainer extends StatelessWidget {
  final String image;
  final String primaryText;
  final String? secondText;

  const MiniContainer(
      {super.key,
        required this.image,
        required this.primaryText,
        this.secondText});

  @override
  Widget build(BuildContext context) {
    bool isSecond = secondText != null;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: Get.width / 5,
        height:  Get.height / 9.5 ,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 8, bottom: isSecond ? 50 : 35),
              child: Image.asset(image),
            ),
            Padding(
              padding: EdgeInsets.only(top: isSecond ? 20 : 40),
              child: Text(
                primaryText,
                style: Get.textTheme.labelLarge,
              ),
            ),
            isSecond
                ? Padding(
              padding: const EdgeInsets.only(top: 55),
              child: Text(
                secondText ?? '',
                style: Get.textTheme.labelMedium,
              ),
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
