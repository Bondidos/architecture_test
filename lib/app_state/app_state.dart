import 'package:architecture_test/model/catalog_item.dart';

class AppState {
  final List<CatalogModel> catalog;
  final List<int> cardItems;

  AppState(this.catalog,this.cardItems);

  List<CatalogModel> get cartItems =>
      catalog.where((element) => cardItems.contains(element.id)).toList();

  bool isInCard(int id) => cardItems.contains(id);

  int  get calculatePrice =>
      cartItems.fold(0, (price, current) => price + current.price);
}