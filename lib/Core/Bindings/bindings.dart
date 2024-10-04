 import 'package:get/get.dart';
import 'package:gs/Features/Splash/splash_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Shop/user_game_main_wrapper_shop_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_viewmodel.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_viewmodel.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.put(UserGameMainWrapperMiningViewModel(),);
    Get.put(UserRegistrationUsernameViewModel());
    Get.put(UserRegistrationGenderViewModel());
    Get.put(UserGameMainWrapperEmpireViewModel());
    Get.put(UserGameMainWrapperShopViewmodel());
    Get.put(UserGameMainWrapperViewModel());
    Get.put(SplashViewmodel());
  }

 }