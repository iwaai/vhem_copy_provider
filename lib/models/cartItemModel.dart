import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class cartItemModel{
  final String id;
  final String title;
  final String image;
  final int quantity;
  final double price;
  

  cartItemModel({
    required this.id,
    required this.image,
    required this.title,
    required this.quantity,
    required this.price
  });
}