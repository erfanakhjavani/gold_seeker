import 'package:hive_flutter/hive_flutter.dart';
import 'package:gs/Features/Users/Registration/UserName/user_registration_username_model.dart';
import 'package:gs/Features/Users/Registration/Gender/user_registration_gender_model.dart';

class HiveManager {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserRegistrationUsernameModelAdapter());
    Hive.registerAdapter(UserRegistrationGenderModelAdapter());
  }
}
