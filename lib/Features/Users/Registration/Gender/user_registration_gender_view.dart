import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_colors.dart';
import 'package:gs/Core/Gen/assets.gen.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_viewmodel.dart';
import '../../../../Core/Constants/app_layout.dart';
import '../../../../Core/Widgets/button_widgets.dart';
import '../UserName/user_registration_username_view.dart';

class UserRegistrationGenderView extends StatelessWidget {
  UserRegistrationGenderView({super.key});

  final UserRegistrationGenderViewModel genderController = Get.put(UserRegistrationGenderViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Assets.jpg.background.image(
                fit: BoxFit.cover
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(

                  padding: const EdgeInsets.only(right: 30.0,left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ManCharacter(genderController: genderController).animate().fadeIn(delay: 5.ms),
                      WomanCharacter(genderController: genderController).animate().fadeIn(delay: 5.ms)
                    ],
                  ),
                ),
                ButtonWidget(
                  text: "NEXT",
                  onPressed: () {
                    Get.to(UserRegistrationUsernameView(),
                        transition: Transition.noTransition
                    );
                  },
                  width: AppLayout.buttonMinWidth * 0.55,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//! Woman Character
class WomanCharacter extends StatelessWidget {
  const WomanCharacter({
    super.key,
    required this.genderController,
  });

  final UserRegistrationGenderViewModel genderController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        genderController.selectCharacter('woman');
      },
      child: Obx(() {
        bool isSelected = genderController.selectedCharacter.value == 'woman';
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Colors.transparent,
                ),
                image: DecorationImage(
                  image: Assets.gif.woman.provider(),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: isSelected ? 70 : 60,
              height: isSelected ? 70 : 60,
            ),
            const Gap(10),
            ButtonWidget(
              text: 'Female',
              onPressed: () {
                genderController.selectCharacter('woman');
              },
              width: 90,
              height: 35,
              color: AppColors.black54,
              textStyle: const TextStyle(
                color:  Colors.white,
                fontSize: 14,
              ),
              radius: 100,
            ),
          ],
        );
      }),
    );
  }
}

//! Man Character
class ManCharacter extends StatelessWidget {
  const ManCharacter({
    super.key,
    required this.genderController,
  });

  final UserRegistrationGenderViewModel genderController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        genderController.selectCharacter('man');
      },
      child: Obx(() {
        bool isSelected = genderController.selectedCharacter.value == 'man';
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color:  Colors.transparent,
                ),
                image: DecorationImage(
                  image: Assets.gif.man.provider(),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: isSelected ? 70 : 60,
              height: isSelected ? 70 : 60,
            ),
            const Gap(10),
            ButtonWidget(
              text: 'Male',
              onPressed: () {
                genderController.selectCharacter('man');
              },
              width: 90,
              height: 35,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              color: AppColors.black54,
              radius: 100,
            ),
          ],
        );
      }),
    );
  }
}
