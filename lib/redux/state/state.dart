import 'dart:collection';

import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/model/catalog_item.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final List<CatalogModel> _catalog;
  final List<int> _orderItems;

  AppState._({
    required List<CatalogModel> catalog,
    required List<int> orderitems,
  })
      : _catalog =catalog,
        _orderItems = orderitems;

  factory AppState.initial(){
    final List<CatalogModel> initItems = [];
    var catalog = GenerateItems().generateItems(15);
    initItems.addAll(catalog);
    List<int> orderItems = [];

    return AppState._(catalog: initItems, orderitems: orderItems);
  }

  AppState copyWith({
  required List<int> orderItems,
}){
    return AppState._(
      catalog: _catalog,
      orderitems: orderItems ?? this._orderItems,
    );
  }

  UnmodifiableListView<int> get orderItems => UnmodifiableListView(_orderItems);
  UnmodifiableListView<CatalogModel> get catalog => UnmodifiableListView(_catalog);
  void completeOrder() => _orderItems.clear();
  int getPrice() =>
      catalog.fold(0, (result, element) => result + element.price);
  void addToCard(int id) {
    _orderItems.add(id);
  }

  void removeFromCard(int id) {
    _orderItems.remove(id);
  }

  void clearCard() {
    _orderItems.clear();
  }
}