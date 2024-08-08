import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_route.dart';
import 'package:gs/Core/Theme/app_themes.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_model.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Core/Bindings/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  Hive.registerAdapter(UserRegistrationUsernameModelAdapter());
  Hive.registerAdapter(UserRegistrationGenderModelAdapter());

  var box = await Hive.openBox('userBox');
  bool isRegistered = box.get('isRegistered', defaultValue: false);

  runApp(Main(isRegistered: isRegistered));
}

class Main extends StatelessWidget {
  final bool isRegistered;

  const Main({super.key, required this.isRegistered});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Gold Seeker',
      theme: AppThemes.primary,
      getPages: AppRoute.pages,
      initialRoute: isRegistered ? AppRoute.userGameMainWrapper : AppRoute.userRegistrationLanguage,
    );
  }
}
