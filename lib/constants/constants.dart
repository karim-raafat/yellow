import 'package:flutter/material.dart';
import 'package:yellow/models/cloth.dart';
import 'package:yellow/models/head_wear.dart';
import 'package:yellow/models/shoes.dart';
import 'package:yellow/models/trousers.dart';
import 'package:yellow/models/tshirts.dart';


Tshirts Tshirt = Tshirts(name: 'Men\s T-shirt', price: 59.97, description: 'Crafted from premium breathable cotton fabric', color: [Colors.red,Colors.blue], imagePath: 'assets/images/Red T.jpeg', gender: Gender.male, discount: 0);

Tshirts TshirtW = Tshirts(name: 'Women\s T-shirt', price: 59.97, description: 'Crafted from premium breathable cotton fabric', color: [Colors.black], imagePath: 'assets/images/Blach T W.jpg', gender: Gender.female, discount: 0);

HeadWear bucketHat = HeadWear(name: 'Bucket Hat', price: 12.37, description: 'Crafted from premium breathable cotton', color: [Colors.black], imagePath: 'assets/images/Bucket Hat.jpg', gender: Gender.unisex, discount: 0);

Shoes shoes = Shoes(name: 'Air Jordan', price: 149.99, description: 'Nike Air Jordan', color: [Colors.blue], imagePath: 'assets/images/Shoes.png', gender: Gender.male, discount: 50,);

Shoes shoesW = Shoes(name: 'Pink Air Jordan', price: 149.99, description: 'Nike Air Jordan', color: [Color(0xFFF8BBD0)], imagePath: 'assets/images/Air Jordan W.jpeg', gender: Gender.female, discount: 50);

Trousers jeans = Trousers(name: 'Jeans', price: 39.99, description: 'Crafted from premium breathable fabric', color: [Colors.grey], imagePath: 'assets/images/Jeans.jpg', gender: Gender.male, discount: 0);

Trousers jeansW = Trousers(name: 'Wide Leg Jeans', price: 39.99, description: 'Crafted from premium breathable fabric', color: [Colors.black], imagePath: 'assets/images/Black Pants W.jpg', gender: Gender.female, discount: 0);
