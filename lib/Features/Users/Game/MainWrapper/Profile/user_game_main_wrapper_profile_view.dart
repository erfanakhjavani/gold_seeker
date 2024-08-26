import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../user_game_main_wrapper_viewmodel.dart';

class UserGameMainWrapperProfileView extends StatelessWidget {
  UserGameMainWrapperProfileView({super.key});

  final userGameMainWrapperViewModel =
      Get.find<UserGameMainWrapperViewModel>();

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
        child: const Center(child: Text("Drop In")),
      ).animate().fadeIn(),
    ).animate();
  }
}




Widget firstOfRowProfile(
    {required int miner, required int friends, required int followers}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Gap(20),
      Expanded(
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Text(
                '$miner',
                textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall,
              ),
              Text(
                'Miner',
                textAlign: TextAlign.center,
                style: Get.textTheme.labelLarge,
              ),
            ],
          ).animate().flip(delay: 300.ms),
        ),
      ),
      const Gap(20),
      Expanded(
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Text(
                '$friends',
                textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall,
              ),
              Text(
                'Friends',
                textAlign: TextAlign.center,
                style: Get.textTheme.labelLarge,
              ),
            ],
          ).animate().flip(delay: 400.ms),
        ),
      ),
      const Gap(20),
      Expanded(
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Text(
                '$followers',
                textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall,
              ),
              Text(
                'Followers',
                textAlign: TextAlign.center,
                style: Get.textTheme.labelLarge,
              ),
            ],
          ).animate().flip(delay: 500.ms),
        ),
      ),
      const Gap(20),
    ],
  );
}


Widget secondOfRowProfile(){
  return Padding(
    padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8),
    child:   const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MiniContainerProfile(
            primaryText: 'Power'
        ),
        Gap(5),
        MiniContainerProfile(

            primaryText: '*'
        )
        ,Gap(5),
        MiniContainerProfile(
            primaryText: '*'
        )
        ,Gap(5),
        MiniContainerProfile(

            primaryText: '*'
        )
        ,Gap(5),
        MiniContainerProfile(

            primaryText: '*'
        ),Gap(5),
        MiniContainerProfile(

            primaryText: '*'
        ), Gap(5),
        MiniContainerProfile(

            primaryText: '*'
        ),
      ],
    ).animate().fadeIn(),
  );
}





class MiniContainerProfile extends StatelessWidget {
  final String? image;
  final String primaryText;
  final String? secondText;

  const MiniContainerProfile(
      {super.key,
         this.image,
        required this.primaryText,
        this.secondText});

  @override
  Widget build(BuildContext context) {
    bool isSecond = secondText != null;
    return Expanded(
      child: Container(

        height:  Get.height / 12 ,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 8, bottom: isSecond ? 50 : 35),
              child: image == null ? const SizedBox.shrink() : Image.asset(image!),
            ),
            Padding(
              padding: EdgeInsets.only(top: isSecond ? 20 : 40),
              child: Text(
                primaryText,
                style: Get.textTheme.labelLarge,
              ),
            ),
            isSecond
                ? Padding(
              padding: const EdgeInsets.only(top: 55),
              child: Text(
                secondText ?? '',
                style: Get.textTheme.labelMedium,
              ),
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 500.ms);
  }
}
