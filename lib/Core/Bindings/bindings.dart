 import 'package:get/get.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Empire/user_game_main_wrapper_empire_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Mining/user_game_main_wrapper_mining_model.dart';
import 'package:gs/Features/Users/Game/MainWrapper/Shop/user_game_main_wrapper_shop_viewmodel.dart';
import 'package:gs/Features/Users/Game/MainWrapper/user_game_main_wrapper_viewmodel.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_viewmodel.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_viewmodel.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserGameMainWrapperMiningModel(),fenix: false);
    Get.lazyPut(() => UserRegistrationUsernameViewModel(),fenix: false);
    Get.lazyPut(() => UserRegistrationGenderViewModel(),fenix: false);
    Get.lazyPut(() => UserGameMainWrapperEmpireViewModel(),fenix: false);
    Get.lazyPut(() => UserGameMainWrapperShopViewmodel(),fenix: false);
    Get.lazyPut(() => UserGameMainWrapperViewModel(),fenix: false);
  }

 }