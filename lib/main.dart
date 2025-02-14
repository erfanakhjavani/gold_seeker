import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_route.dart';
import 'package:gs/Core/Theme/app_themes.dart';
import 'Core/Bindings/bindings.dart';
import 'Core/Database/hive_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await HiveManager.initializeHive();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Gold Seeker',
      theme: AppThemes.primary,
      getPages: AppRoute.pages,
      initialRoute: AppRoute.splashView,
    );
  }
}
