import 'package:flutter/material.dart';

abstract class Cloth {
  String name;
  String imagePath;
  double price;
  String description;
  List<Color> color;
  bool isFavorite = false;
  Gender gender;
  double discount;
  String? size;

  Cloth({required this.name,required this.price, required this.description,required this.color,required this.imagePath,required this.gender,required this.discount});
}
enum Gender{
  male,
  female,
  unisex
}