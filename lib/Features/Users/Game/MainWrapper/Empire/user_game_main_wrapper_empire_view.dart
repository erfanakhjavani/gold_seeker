
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Gen/assets.gen.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_viewmodel.dart';

class UserGameMainWrapperEmpireView extends StatelessWidget {
  const UserGameMainWrapperEmpireView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(UserGameMainWrapperEmpireViewModel());

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
      )
    );
  }
}

class SpinningWheelWidget extends StatelessWidget {
  const SpinningWheelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<UserGameMainWrapperEmpireViewModel>();

    return SingleChildScrollView(
      child: RotationTransition(
        turns: viewModel.animation,
        child: Assets.png.erth.image(width: Get.width,height: 500)
      ),
    );
  }
}
