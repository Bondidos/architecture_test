import 'package:flutter/material.dart';

class CatalogModel {
  final Color color;
  final String name;
  final int price;
  final int id;

  CatalogModel(
      {required this.color,
      required this.name,
      required this.id,
      required this.price});
}
