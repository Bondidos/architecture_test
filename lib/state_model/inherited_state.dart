import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/model/catalog_item.dart';

class AppState{
  final List<CatalogModel> _list = [];
  final List<int> _cardItems = [];
  AppState(){
    _list.addAll(GenerateItems().generateItems(150));
  }

  List<CatalogModel> get catalog => _list;
  List<CatalogModel> get cardItems =>
      _list.where((element) => _cardItems.contains(element.id)).toList();

  bool isInCard(int id) => _cardItems.contains(id);
  void addItem(int id) => _cardItems.add(id);
  void removeFromCard(int id) => _cardItems.remove(id);
  void clearCard() => _cardItems.clear();
  int calculateBill() => cardItems.fold(0, (bill, item) => bill + item.price);
}