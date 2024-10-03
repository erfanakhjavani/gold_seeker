import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gs/Features/Splash/splash_model.dart';
import 'package:gs/Features/Splash/splash_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Core/Gen/assets.gen.dart';


class SplashView extends GetView<SplashViewmodel> {


   const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.webp.logo.image(
              width: MediaQuery.sizeOf(context).width * 0.8
            ).animate().flipH(delay: 1000.ms),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: GetBuilder<SplashViewmodel>(
                builder: (controller) {
                    if (controller.connectionStatus.value == ConnectionStatus.connected
                   || controller.connectionStatus.value ==
                    ConnectionStatus.initial
                    ) {
                      return Center(
                        child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.white,
                          size: 40,
                        ),
                      );
                  }
                    else if (controller.connectionStatus.value ==
                        ConnectionStatus.disconnected) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'please check your connection..!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Irs"),
                          ),
                          IconButton(
                            splashColor: Colors.white,
                            onPressed: () {
                              controller.checkConnection();
                            },
                            icon: const Icon(Icons.autorenew, color: Colors.white),
                          ),
                        ],
                      );
                    }
                      return const SizedBox(); // برای رفع نیاز به return در Obx
                  })),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

}
