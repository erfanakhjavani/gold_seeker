import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

import '../features/features_intro/feature_login/screens/login_screen.dart';

class BannerViewPage extends StatefulWidget {
  const BannerViewPage({Key? key}) : super(key: key);

  @override
  _BannerViewPageState createState() => _BannerViewPageState();
}

class _BannerViewPageState extends State<BannerViewPage> {
  bool isShow = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isShow = false;
    });

    Appodeal.setBannerCallbacks(
      onBannerLoaded: (isPrecache) =>
          print('onBannerLoaded: isPrecache - $isPrecache'),
      onBannerFailedToLoad: () => print('onBannerFailedToLoad'),
      onBannerShown: () => print('onBannerShown'),
      onBannerShowFailed: () => print('onBannerShowFailed'),
      onBannerClicked: () => print('onBannerClicked'),
      onBannerExpired: () => print('onBannerExpired'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Rewarded Video',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ButtonColorSide(
                  textSize: 20,
                  width: 200,
                  height: 50,
                  colorSide: Colors.blue,
                  text: "Show Banner View",
                  onPressed: () async {
                    setState(() {
                      isShow = true;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ButtonColorSide(
                  textSize: 20,
                  width: 200,
                  height: 50,
                  colorSide: Colors.red,
                  text: "Hide Banner View",
                  onPressed: () async {
                    setState(() {
                      isShow = false;
                    });
                  }),
            ),
            //Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Visibility(
                  visible: isShow,
                  child: AppodealBanner(
                      adSize: AppodealBannerSize.BANNER, placement: "default")),
            ),
            SizedBox(height: 60,),
            ButtonColorSide(colorSide: Colors.white, text: 'Back', onPressed: (){
              Get.back();
            })
          ],
        ),
      ),
    );
  }
}
