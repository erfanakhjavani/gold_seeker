
import 'package:hive/hive.dart';
part 'user_registration_gender_model.g.dart';

@HiveType(typeId: 1)
class UserRegistrationGenderModel {
  @HiveField(0)
  String? gender;

  UserRegistrationGenderModel({this.gender});
}