
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_seeker/features/features_intro/feature_login/screens/login_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

import 'banner_view.dart';



class AppodealDemoApp extends StatefulWidget {
  @override
  _AppodealDemoAppState createState() => _AppodealDemoAppState();
}

class _AppodealDemoAppState extends State<AppodealDemoApp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Appodeal', style: TextStyle(fontSize: 30,color: Colors.white)),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ButtonColorSide(
                textSize: 20,
                width: 200,
                text: 'Reward Video',
                colorSide: Colors.blue,
                onPressed: () async {
                  if(await Appodeal.isLoaded(AppodealAdType.RewardedVideo) == true ) {
                    Get.defaultDialog(
                        title: 'Loading Video',
                        content: LoadingAnimationWidget.inkDrop(
                            color: Colors.blue, size: 30)
                    );
                    await Future.delayed(Duration(seconds: 3));
                    Future.delayed(Duration(seconds: 3));
                    Navigator.pop(context);
                    Appodeal.show(AppodealAdType.RewardedVideo);

                  }else {
                    Get.defaultDialog(
                        textCancel: 'close',
                        title: 'Loading Faild!',
                        content: Icon(Icons.close, color: Colors.red,));
                  }
                },
              )
            ),
          ],
        ),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: ButtonColorSide(
                  textSize: 20,
                  width: 200,
                  height: 50,
                  text: 'Banner View',
                  colorSide: Colors.red,
                  onPressed: (){
                    Get.to(BannerViewPage(),transition: Transition.fade);
                  },
                )
            ),

            SizedBox(height: 60,),



            ButtonColorSide(colorSide: Colors.white, text: 'Back', onPressed: (){
              Get.back();
            })
      ]),
    );
  }
}


