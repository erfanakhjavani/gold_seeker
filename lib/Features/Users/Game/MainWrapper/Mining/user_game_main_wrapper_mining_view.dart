import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Widgets/button_widgets.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_viewmodel.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_viewmodel.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_viewmodel.dart';  // Import ViewModel
import '../../../../../Core/Gen/assets.gen.dart';

class UserGameMainWrapperMiningView extends StatelessWidget {
  UserGameMainWrapperMiningView({super.key});

  final UserGameMainWrapperMiningViewModel userGameMainWrapperViewModel =
  Get.put(UserGameMainWrapperMiningViewModel());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(67, 155, 171, 1.0),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 4.3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black,
                  Color.fromRGBO(67, 155, 171, 1.0),
                ],
              ),
            ),
            child: Column(
              children: [
                customAppBar(
                  text: 'Mining',
                  color: Colors.white,
                  backColor: Colors.black,
                  icon: Icons.arrow_downward,
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
                firstOfRow(),
                secondOfRow(userGameMainWrapperViewModel)
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Assets.jpg.backgroundGame.provider(),
                    fit: BoxFit.cover),
                border: const Border(
                  top: BorderSide(
                      width: 4, color: Color.fromRGBO(67, 155, 171, 1.0)),
                ),
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
                              userGameMainWrapperViewModel.addTwoHours();
                            },
                            child: MiniContainer(
                              image: Assets.png.craft.path,
                              primaryText: 'Energy',
                              secondText:
                              userGameMainWrapperViewModel.countdown.value,
                            ),
                          ),
                        ),
                        MiniContainer(
                          image: Assets.png.craft.path,
                          primaryText: 'Level 8',
                        ),
                        MiniContainer(
                          image: Assets.png.shovel.path,
                          primaryText: 'Level 4',
                        ),
                        MiniContainer(
                          image: Assets.png.hatter.path,
                          primaryText: 'Level 10',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Row firstOfRow() {
  final UserRegistrationGenderViewModel genderViewModel =
  Get.put(UserRegistrationGenderViewModel());
  final UserRegistrationUsernameViewModel usernameViewModel =
  Get.put(UserRegistrationUsernameViewModel());
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Color.fromRGBO(243, 195, 39, 1.0),
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
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Obx(
              () =>
              Text(
                usernameViewModel.getUserName(),
                // استفاده از ویو مدل نام کاربری
                style: Get.textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Obx(
              () =>
              Text(
                genderViewModel.selectedCharacter.value.isEmpty
                    ? 'Gender not set'
                    : genderViewModel.selectedCharacter.value,
                // استفاده از ویو مدل جنسیت
                style: Get.textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
        ),
      ),
    ],
  );
}

Row secondOfRow(
    UserGameMainWrapperMiningViewModel userGameMainWrapperViewModel) {
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
        height: Get.height / 8.4,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 103, 117, 0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: isSecond ? 10 : 8, bottom: isSecond ? 40 : 28),
              child: Image.asset(image),
            ),
            Padding(
              padding: EdgeInsets.only(top: isSecond ? 45 : 70),
              child: Text(
                primaryText,
                style: Get.textTheme.labelLarge,
              ),
            ),
            isSecond
                ? Padding(
              padding: const EdgeInsets.only(top: 80),
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
