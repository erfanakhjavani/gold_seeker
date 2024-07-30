import 'package:get/get.dart';
import 'package:gs/Features/Users/Registration/Language/user_registration_language_model.dart';

class UserRegistrationLanguageViewModel extends GetxController{
  late UserRegistrationLanguageModel _model;
  UserRegistrationLanguageModel get model => _model;
  var selectedLanguage = 'Language'.obs;

  final List<String> languages = [
    'Language',
    'English',
    'French',
    'Spanish',
    'Hindi',
    'Chinese',
    'Russian',
    'Italian',
  ];

   updateLanguage(String language) {
    selectedLanguage.value = language;
  }


  UserRegistrationLanguageViewModel() {
    _model = UserRegistrationLanguageModel();
  }
}