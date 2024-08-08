import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'user_registration_gender_model.dart';


class UserRegistrationGenderViewModel extends GetxController {
  late UserRegistrationGenderViewModel _model;
  UserRegistrationGenderViewModel get model => _model;

  var selectedCharacter = ''.obs;
  var isInitialized = false.obs;

  late Box<UserRegistrationGenderModel> genderBox;

  @override
  void onInit() async {
    super.onInit();
    await Hive.openBox<UserRegistrationGenderModel>('genderBox');
    genderBox = Hive.box<UserRegistrationGenderModel>('genderBox');

    if (genderBox.isNotEmpty) {
      selectedCharacter.value = genderBox.getAt(0)?.gender ?? '';
    }

    isInitialized.value = true;
  }

  void selectCharacter(String character) {
    selectedCharacter.value = character;

    // ذخیره جنسیت انتخاب‌شده در Hive
    var genderModel = UserRegistrationGenderModel(gender: character);
    if (genderBox.isEmpty) {
      genderBox.add(genderModel);
    } else {
      genderBox.putAt(0, genderModel);
    }
  }

  @override
  void onClose() {
    genderBox.close();
    super.onClose();
  }
}