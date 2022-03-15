import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/model/catalog_item.dart';
import 'package:scoped_model/scoped_model.dart';

class AppStateModel extends Model {
  final List<CatalogModel> _catalog = [];
  final List<int> _card = [];

  AppStateModel() {
    catalog.addAll(GenerateItems().generateItems(15));
  }

  List<CatalogModel> get catalog => _catalog;

  List<CatalogModel> get card =>
      _catalog.where((element) => _card.contains(element.id)).toList();

  void addItem(int id) {
    _card.add(id);
    notifyListeners();
  }

  void removeItem(int id) {
    _card.remove(id);
    notifyListeners();
  }

  void clearCard() {
    _card.clear();
    notifyListeners();
  }

  bool isInCard(int id) => _card.contains(id);

  int calculatePrice() =>
      card.fold(0, (result, item) => result += item.price);
}
