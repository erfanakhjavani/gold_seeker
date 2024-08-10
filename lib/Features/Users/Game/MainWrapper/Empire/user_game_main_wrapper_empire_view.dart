import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Gen/assets.gen.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';

import '../../../Registration/UserName/user_registration_username_viewmodel.dart';

class UserGameMainWrapperEmpireView
    extends GetView<UserGameMainWrapperEmpireViewModel> {
  UserGameMainWrapperEmpireView({super.key});

  final UserGameMainWrapperViewModel userGameMainWrapperViewModel =
      Get.put(UserGameMainWrapperViewModel());
  final UserRegistrationUsernameViewModel usernameViewModel =
      Get.put(UserRegistrationUsernameViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userGameMainWrapperViewModel.backgroundColor.value,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.jpg.backSky.provider(), fit: BoxFit.cover),
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        width: Get.width * .9,
                        height: Get.height / 8,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(
                                194, 194, 194, 0.6705882352941176),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          firstOfRow(
                              userRegistration: usernameViewModel,
                              color: Colors.blueAccent
                          ),
                          secondOfRow(userGameMainWrapperViewModel: userGameMainWrapperViewModel)
                        ]),
                      ),
                      const Gap(10)
                    ]);
                  }),
            )
          ],
        ),
      ).animate().fadeIn(),
    ).animate();
  }
  Row firstOfRow({required UserRegistrationUsernameViewModel userRegistration,
    required Color color
  }) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 6, top: 9, left: 42.0),
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

      ],
    );
  }

  Row secondOfRow({
    required UserGameMainWrapperViewModel userGameMainWrapperViewModel
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: Get.width / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Obx(
                      () =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Power',
                            style: Get.textTheme.bodySmall?.copyWith(
                                color: const Color.fromRGBO(
                                    183, 226, 171, 1.0)),
                          ),
                          Wrap(
                            children: [
                              Text(
                                '${userGameMainWrapperViewModel.power
                                    .value}/',
                                style: Get.textTheme.bodySmall?.copyWith(
                                    letterSpacing: 1,
                                    color: const Color.fromRGBO(
                                        183, 226, 171, 1.0)),
                              ),
                              Text(
                                '100',
                                style: Get.textTheme.bodySmall?.copyWith(
                                    letterSpacing: 1,
                                    color: const Color.fromRGBO(
                                        20, 225, 37, 1.0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                ),
              ),
              Obx(
                    () =>
                    LinearProgressIndicator(
                      backgroundColor: const Color.fromRGBO(
                          119, 124, 68, 1.0),
                      value: userGameMainWrapperViewModel.power.value / 100,
                      minHeight: 2,
                      color: const Color.fromRGBO(20, 225, 37, 1.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
              ),
            ],
          ),
        ),

      ],
    );
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
          child: Assets.png.erth.image(width: Get.width, height: 500)),
    );
  }


}
