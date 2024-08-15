
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserGameMainWrapperEmpireModel{
  final ImageProvider imageLevel;
  final String name;
  final ImageProvider genderAvatar;
  final Color color;
  final int power;
  final bool isLocked;

  UserGameMainWrapperEmpireModel({
      required this.imageLevel,
    required this.name,
    required this.genderAvatar,
    required this.color,
    required this.power,
    required this.isLocked,
  });
}