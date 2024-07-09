import 'package:yellow/models/cloth.dart';

class Tshirts extends Cloth{
  Tshirts({required super.name, required super.price, required super.description, required super.color, required super.imagePath, required super.gender, required super.discount});

}

enum Size{
  S,
  M,
  L,
  XL,

}