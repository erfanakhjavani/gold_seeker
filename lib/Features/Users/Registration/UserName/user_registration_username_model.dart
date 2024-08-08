import 'package:hive/hive.dart';
part 'user_registration_username_model.g.dart';


@HiveType(typeId: 0)
class UserRegistrationUsernameModel{
  @HiveField(0)
  String? userName;
  @HiveField(1)
  int? id;

  UserRegistrationUsernameModel({this.id, this.userName});

}