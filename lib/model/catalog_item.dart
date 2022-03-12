import 'package:flutter/material.dart';

class CatalogModel {
  final Color color;
  final String name;
  final int price;
  bool isAdded;

  CatalogModel(
      {required this.color,
      required this.name,
      required this.isAdded,
      required this.price});
}
