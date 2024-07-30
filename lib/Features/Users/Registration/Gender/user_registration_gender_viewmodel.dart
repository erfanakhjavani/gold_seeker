import 'package:get/get.dart';

class UserRegistrationGenderViewModel extends GetxController{
  late UserRegistrationGenderViewModel _model;
  UserRegistrationGenderViewModel get model => _model;

  var selectedCharacter = ''.obs;
  var isInitialized = false.obs;

  void selectCharacter(String character) {
    selectedCharacter.value = character;
  }


}