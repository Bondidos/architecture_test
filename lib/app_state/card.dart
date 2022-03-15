import 'package:architecture_test/model/catalog_item.dart';
import 'package:flutter/cupertino.dart';

import 'catalog.dart';

class CardCheck extends ChangeNotifier {
  late Catalog _catalog;
  final List<int> _itemId = [];

  Catalog get catalog => _catalog;

  List<CatalogModel> get card =>
      catalog.items.where((element) => _itemId.contains(element.id)).toList();

  int getPrice() =>
      card.fold(0, (result, element) => result + element.price);

  set catalog(Catalog ctlg) {
    _catalog = ctlg;
    notifyListeners();
  }

  bool isInCard(int id) => _itemId.contains(id);

  void addToCard(int id) {
    _itemId.add(id);
    notifyListeners();
  }

  void removeFromCard(int id) {
    _itemId.remove(id);
    notifyListeners();
  }

  void clearCard() {
    _itemId.clear();
    notifyListeners();
  }
}
