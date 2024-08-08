import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_layout.dart';
import 'package:gs/Core/Widgets/button_widgets.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_view.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_view.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_viewmodel.dart';
import '../../../../Core/Gen/assets.gen.dart';

class UserRegistrationUsernameView extends StatelessWidget {
  UserRegistrationUsernameView({super.key});

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
              fit: BoxFit.cover,
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
                    text: 'Back'
                ),
                TextFields(
                  text: 'Username',
                  controller: usernameController.usernameController,
                  padding: AppLayout.primaryAllPadding * 4,
                  hintStyle: Get.textTheme.bodyLarge,
                ).animate().fadeIn(delay: 5.ms),
                Obx(() {
                  bool isSelected = usernameController.username.value.isEmpty;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isSelected ? AppLayout.buttonMinWidth * 0.45 : AppLayout.buttonMinWidth * 0.55,
                    child: ButtonWidget(
                      text: "START",
                      onPressed: () {
                        isSelected ? null :
                            usernameController.setUserName(usernameController.username.value);
                        Get.to(UserGameMainWrapperView(),
                          transition: Transition.fadeIn
                        );
                      },
                      color: isSelected ? Colors.grey : Colors.deepOrangeAccent,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
