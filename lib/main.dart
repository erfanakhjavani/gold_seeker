import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';
import 'features/features_intro/feature_splash/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'features/features_intro/feature_splash/presentation/screens/splash_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> SplashCubit()),
      ], child:  MyApp()));
}



class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initialization();
    super.initState();
  }

  initialization() {
    Appodeal.setTesting(true); //only not release mode
    Appodeal.setLogLevel(Appodeal.LogLevelVerbose);
    Appodeal.setAutoCache(AppodealAdType.All,true);
    Appodeal.setSmartBanners(true);

    Appodeal.setUseSafeArea(true);
    Appodeal.initialize(
      appKey: exampleAppodealKey,
      adTypes: [
        AppodealAdType.RewardedVideo,
        AppodealAdType.Banner,
      ],
      onInitializationFinished: (errors) {
        errors?.forEach((error) => print(error.description));
        print("onInitializationFinished: errors - ${errors?.length ?? 0}");
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

final String exampleAppodealKey = 'eb8eeeeabdf68f89ebebcdfd120dfd85d57523a5272fd98f';
