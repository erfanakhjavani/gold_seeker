import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../user_game_main_wrapper_viewmodel.dart';

class UserGameMainWrapperProfileView extends StatelessWidget {
  UserGameMainWrapperProfileView({super.key});

  final UserGameMainWrapperViewModel userGameMainWrapperViewModel =
      Get.put(UserGameMainWrapperViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userGameMainWrapperViewModel.backgroundColor.value,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: const Center(child: Text("Profile")),
      ).animate().fadeIn(),
    ).animate();
  }
}

Widget firstOfColumnProfile(
    {required int miner, required int friends, required int followers}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              '$miner',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '$friends',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '$followers',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              'Miner',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'Friends',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'Followers',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ],
  ).animate().fadeIn();
}
