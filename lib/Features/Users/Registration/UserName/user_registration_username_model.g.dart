// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_username_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRegistrationUsernameModelAdapter
    extends TypeAdapter<UserRegistrationUsernameModel> {
  @override
  final int typeId = 0;

  @override
  UserRegistrationUsernameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRegistrationUsernameModel(
      id: fields[1] as int?,
      userName: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserRegistrationUsernameModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRegistrationUsernameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
