import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_view.dart';
import 'package:gs/Features/Users/Registration/Language/user_registration_language_view.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_view.dart';

class AppRoute{
  static const String splash = '/';
  static const String userRegistrationLanguage = '/Users-registration-language';
  static const String userRegistrationGender = '/Users-registration-gender';
  static const String userRegistrationUserName = '/Users-registration-gender';

  
  static List<GetPage> get pages => [
    GetPage(name: AppRoute.userRegistrationLanguage, page: () =>  UserRegistrationLanguageView(),),
    GetPage(name: AppRoute.userRegistrationGender, page: () =>  UserRegistrationGenderView(),),
    GetPage(name: AppRoute.userRegistrationUserName, page: () =>  UserRegistrationUsernameView(),),

  ];
  
  
}

