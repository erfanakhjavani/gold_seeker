// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_gender_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRegistrationGenderModelAdapter
    extends TypeAdapter<UserRegistrationGenderModel> {
  @override
  final int typeId = 1;

  @override
  UserRegistrationGenderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRegistrationGenderModel(
      gender: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserRegistrationGenderModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRegistrationGenderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
