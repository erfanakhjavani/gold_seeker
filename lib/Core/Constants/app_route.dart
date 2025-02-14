import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gs/Features/Splash/splash_view.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_and_username_view.dart';
import 'package:gs/Features/Users/Registration/Language/user_registration_language_view.dart';

import '../../Features/Users/Game/MainWrapper/user_game_main_wrapper_view.dart';

class AppRoute{
  static const String userRegistrationLanguage = '/Users-registration-language';
  static const String userRegistrationGender = '/Users-registration-gender';
  static const String userGameMainWrapper = '/Users-Game-Main-Wrapper';
  static const String splashView = '/Splash-View';

  
  static List<GetPage> get pages => [
    GetPage(name: AppRoute.userRegistrationLanguage, page: () =>  UserRegistrationLanguageView(),),
    GetPage(name: AppRoute.userRegistrationGender, page: () =>  UserRegistrationGenderView(),),
    GetPage(name: AppRoute.userGameMainWrapper, page: () =>  UserGameMainWrapperView(),),
    GetPage(name: AppRoute.splashView, page: () =>   SplashView(),),

  ];
  
  
}

