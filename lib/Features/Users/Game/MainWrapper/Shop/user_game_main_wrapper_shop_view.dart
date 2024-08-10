

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../user_game_main_wrapper_viewmodel.dart';

class UserGameMainWrapperShopView extends StatelessWidget {
   UserGameMainWrapperShopView({super.key});


  final UserGameMainWrapperViewModel userGameMainWrapperViewModel =
  Get.put(UserGameMainWrapperViewModel());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: userGameMainWrapperViewModel.backgroundColor.value,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: const Center(
          child: Text("Shop")
        ),
      ).animate().fadeIn(),
    ).animate();
  }
}
