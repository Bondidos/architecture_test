import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/model/catalog_item.dart';

class Catalog{
  final List<CatalogModel> items = [];
  Catalog(){
    items.addAll(GenerateItems().generateItems(10));
  }

  CatalogModel getById(int id) =>
      items.firstWhere((element) => element.id == id);

}