
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Gen/assets.gen.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_viewmodel.dart';

import '../../../../../Core/Widgets/button_widgets.dart';
import '../Mining/user_game_main_wrapper_mining_view.dart';
import '../Mining/user_game_main_wrapper_mining_viewmodel.dart';

class UserGameMainWrapperEmpireView extends StatelessWidget {
   UserGameMainWrapperEmpireView({super.key});

  final UserGameMainWrapperMiningViewModel userGameMainWrapperViewModel =
  Get.put(UserGameMainWrapperMiningViewModel());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 73, 111, 1.0),
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
                  Color.fromRGBO(1, 73, 111, 1.0),
                ],
              ),
            ),
            child: Column(
              children: [
                customAppBar(
                  text: 'Empire',
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
                    image: Assets.jpg.backSky.provider(),
                    fit: BoxFit.cover),
                border: const Border(
                  top: BorderSide(
                      width: 2, color: Color.fromRGBO(8, 93, 138, 1.0)),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: const Center(
                child: SpinningWheelWidget(),
              ),
            ),
          ),
        ],
      ),
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
        child: Assets.png.erth.image(width: Get.width,height: 500)
      ),
    );
  }
}
