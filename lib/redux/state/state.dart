import 'dart:collection';
import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/model/catalog_item.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final List<CatalogModel> _catalog;
  final List<int> _orderItems;

  const AppState._({
    required List<CatalogModel> catalog,
    required List<int> orderItems,
  })
      : _catalog =catalog,
        _orderItems = orderItems;

  factory AppState.initial(){
    final List<CatalogModel> initItems = [];
    var catalog = GenerateItems().generateItems(15);
    initItems.addAll(catalog);
    List<int> orderItems = [];

    return AppState._(catalog: initItems, orderItems: orderItems);
  }

  AppState copyWith({
  required List<int> orderItems,
}){
    return AppState._(
      catalog: _catalog,
      orderItems: orderItems,
    );
  }

  UnmodifiableListView<int> get orderItems => UnmodifiableListView(_orderItems);
  UnmodifiableListView<CatalogModel> get catalog => UnmodifiableListView(_catalog);

  List<CatalogModel> get inCard =>
      catalog.where((i) => orderItems.contains(i.id)).toList();

  int getPrice() =>
      orderItems.fold(0, (result, element) =>
      result + catalog.firstWhere((it) => it.id == element).price);

  bool isInCard(int id) => orderItems.contains(id);

}