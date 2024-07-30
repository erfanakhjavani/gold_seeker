import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_layout.dart';
import 'package:gs/Core/Gen/fonts.gen.dart';
import 'package:gs/Core/Widgets/button_widgets.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_view.dart';
import 'package:gs/Features/Users/Registration/Language/user_registration_language_viewmodel.dart';

import '../../../../Core/Gen/assets.gen.dart';

class UserRegistrationUsernameView extends StatelessWidget {
  UserRegistrationUsernameView({super.key});

  final UserRegistrationLanguageViewModel languageController = Get.put(UserRegistrationLanguageViewModel());


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
            padding: const EdgeInsets.only(top: 200,bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[


                ButtonWidget(
                  text: "NEXT",
                  onPressed: (){

                    Get.to(UserRegistrationGenderView(),
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

