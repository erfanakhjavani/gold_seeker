import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_colors.dart';
import 'package:gs/Core/Gen/assets.gen.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_view.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_viewmodel.dart';
import 'package:hive/hive.dart';
import '../../../../Core/Constants/app_layout.dart';
import '../../../../Core/Widgets/button_widgets.dart';
import '../UserName/user_registration_username_viewmodel.dart';

class UserRegistrationGenderView extends StatelessWidget {
  UserRegistrationGenderView({super.key});

  final UserRegistrationGenderViewModel genderController = Get.put(UserRegistrationGenderViewModel());
  final UserRegistrationUsernameViewModel usernameController = Get.put(UserRegistrationUsernameViewModel());

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
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                customAppBar(
                    icon: Icons.arrow_back,
                    color: Colors.black,
                    backColor: Colors.transparent,
                    text: 'Back',

                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ManCharacter(genderController: genderController).animate().fadeIn(delay: 5.ms),
                      WomanCharacter(genderController: genderController).animate().fadeIn(delay: 5.ms)
                    ],
                  ),
                ),
                TextFields(
                  text: 'Username',
                  controller: usernameController.usernameController,
                  padding: AppLayout.primaryAllPadding * 4,
                  hintStyle: Get.textTheme.bodyLarge,
                ).animate().fadeIn(delay: 5.ms),
                Obx(() {
                  bool isSelected =
                      genderController.selectedCharacter.value.isEmpty ||
                          usernameController.username.value.isEmpty;
                  return AnimatedCrossFade(
                    firstChild: AnimatedContainer(
                      curve: Curves.easeInOutQuart,
                      duration: const Duration(milliseconds: 300),
                      width: isSelected ? AppLayout.buttonMinWidth * 0.35 : AppLayout.buttonMinWidth * 0.45,
                      child: ButtonWidget(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Start",style: Get.textTheme.bodyLarge,),
                            const Gap(3),
                            const Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                        onPressed: () async{
                          if (!isSelected) {

                            genderController.selectCharacter(genderController.selectedCharacter.value);
                            usernameController.setUserName(usernameController.username.value);
                            var box = await Hive.openBox('userBox');
                            box.put('isRegistered', true);
                            Get.to(UserGameMainWrapperView(), transition: Transition.noTransition);
                          }
                        },
                        color: isSelected ? Colors.grey : Colors.orange,
                      ),
                    ),
                    secondChild: AnimatedContainer(
                      curve: Curves.easeInOutQuart,
                      duration: const Duration(milliseconds: 300),
                      width: isSelected ? AppLayout.buttonMinWidth * 0.35 : AppLayout.buttonMinWidth * 0.45,
                      child: ButtonWidget(
                        text: "Next",
                        onPressed: () {},
                        color: isSelected ? Colors.grey : Colors.orange,
                      ),

                    ),crossFadeState: isSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: 200.ms,
                    secondCurve: Curves.linear,
                    firstCurve: Curves.linear,
                  );

                })

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
            AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Colors.transparent,
                ),
                image: DecorationImage(
                  image: Assets.webp.woman.provider(),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: isSelected ? 80 : 70,
              height: isSelected ? 80 : 70,
              duration: 300.ms,
              curve: Curves.easeInOutQuart,
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
            AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color:  Colors.transparent,
                ),
                image: DecorationImage(
                  image: Assets.webp.man.provider(),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: isSelected ? 80 : 70,
              height: isSelected ? 80 : 70,
              duration: 300.ms,
              curve: Curves.easeInOutQuart,
            ),
            const Gap(10),
            ButtonWidget(
              text: 'Male',
              onPressed: () {
                genderController.selectCharacter('man');
              },
              width: 90,
              height: 35,
              textStyle: const TextStyle(
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
