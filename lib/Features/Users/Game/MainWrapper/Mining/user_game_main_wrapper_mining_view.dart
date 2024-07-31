import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_viewmodel.dart';

class UserGameMainWrapperMiningView extends StatelessWidget {
  UserGameMainWrapperMiningView({super.key});

  final UserGameMainWrapperMiningViewModel userGameMainWrapperViewModel =
      Get.put(UserGameMainWrapperMiningViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 155, 171, 1.0),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 4,
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
          ),
          Expanded(
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/jpg/backgroundGame.jpg'),
                    fit: BoxFit.cover),
                border: Border(
                  top: BorderSide(width: 4,
                      color:Color.fromRGBO(67, 155, 171, 1.0)),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
