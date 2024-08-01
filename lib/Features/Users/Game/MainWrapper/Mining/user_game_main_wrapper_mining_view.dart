import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_colors.dart';
import 'package:gs/Core/Constants/app_layout.dart';
import 'package:gs/Core/Utils/global_exensions.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_viewmodel.dart';

import '../../../../../Core/Gen/assets.gen.dart';

class UserGameMainWrapperMiningView extends StatelessWidget {
  UserGameMainWrapperMiningView({super.key});

  final UserGameMainWrapperMiningViewModel userGameMainWrapperViewModel =
      Get.put(UserGameMainWrapperMiningViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){},
                    icon: Icon(
                      Icons.arrow_downward,color: Colors.white,),
                  ),
                  Text('Mining',style: Get.textTheme.bodyMedium,)
                ],
              )

            ],
          ),
        ),
        primary: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings),color: Colors.white,)
        ],
      ),
      backgroundColor: const Color.fromRGBO(67, 155, 171, 1.0),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 5.0,
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
                  top: BorderSide(
                      width: 4, color: Color.fromRGBO(67, 155, 171, 1.0)),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: AppLayout.primaryContainerPadding,
                    child: Row(
                      children: [
                        MiniContainer(
                          image: 'assets/png/craft.png',
                          primaryText: 'Energy',
                          secondText: '00:15',
                        ),MiniContainer(
                          image: 'assets/png/craft.png',
                          primaryText: 'Level 8',
                        ),MiniContainer(
                          image: 'assets/png/shovel.png',
                          primaryText: 'Level 4',
                        ),MiniContainer(
                          image: 'assets/png/hatter.png',
                          primaryText: 'Level 10',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MiniContainer extends StatelessWidget {
  final String image;
  final String primaryText;
  final String? secondText;


  const MiniContainer({super.key, required this.image, required this.primaryText, this.secondText});



  @override
  Widget build(BuildContext context) {
    bool isSecond = secondText != null;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: Get.width / 5.1,
        height: Get.width / 3.8,
        decoration: BoxDecoration(
            color:
                // const Color.fromRGBO(255, 255, 255, 0.4),
                const Color.fromRGBO(40, 103, 117, 0.8),
            borderRadius: BorderRadius.circular(12)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: isSecond ? 10 : 8, bottom: isSecond ? 40 : 32),
              child: Image.asset(image),
            ),
            Padding(
              padding:   EdgeInsets.only(top: isSecond ? 45 : 70),
              child: Text(
                primaryText,
                style: Get.textTheme.labelLarge,
              ),
            ),
            isSecond ? Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                secondText ?? '',
                style: Get.textTheme.labelMedium,
              ),
            ) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
