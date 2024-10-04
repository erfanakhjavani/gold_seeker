import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'user_registration_gender_model.dart';

class UserRegistrationGenderViewModel extends GetxController {
  var selectedCharacter = ''.obs;
  late Box<UserRegistrationGenderModel> genderBox;

  @override
  Future<void> onInit() async {
    super.onInit();
    genderBox = await Hive.openBox<UserRegistrationGenderModel>('genderBox');

    selectedCharacter.value = genderBox.getAt(0)?.gender ?? '';
  }

  void selectCharacter(String character) {
    selectedCharacter.value = character;

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
