import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';
import '../../../../Core/Gen/assets.gen.dart';
import '../../Registration/UserName/user_registration_username_viewmodel.dart';
import 'Profile/user_game_main_wrapper_profile_view.dart';

Row firstOfRow(
    {required UserRegistrationUsernameViewModel userRegistration,
      required Color color,
      required ImageProvider image,
      required int index}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 18),
        child: SizedBox(
          width: Get.width / 4,
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
                  image: DecorationImage(image: image),
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
          if (index != 3) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                userRegistration.getUserName(),
                // استفاده از ویو مدل نام کاربری
                style: Get.textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
            ).animate().fadeIn();
          } else if (index == 3) {
            return firstOfRowProfile(followers: 50, friends: 10, miner: 4);
          }
          return const SizedBox.shrink();
        }),
      ),
    ],
  );
}

Widget secondOfRow(
    {required UserGameMainWrapperViewModel userGameMainWrapperViewModel,
      required int index}) {
  if(index != 3) {
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
    ).animate().fadeIn();
  }
  else{
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: secondOfRowProfile(),
    );
  }
}