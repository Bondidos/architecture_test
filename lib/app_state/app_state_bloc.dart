import 'dart:async';

import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/model/catalog_item.dart';

import 'app_state.dart';
import 'cart_event.dart';

class AppStateBloc{
  final _stateStreamController = StreamController<AppState>.broadcast();
  final _eventStreamController = StreamController<CartEvent>();

  late AppState _appState;

  AppStateBloc() {
    List<CatalogModel> catalog = GenerateItems().generateItems(15);
    _appState = AppState(catalog, []);

    _eventStreamController.stream.listen(_mapEventToSTate);
  }

  AppState get appState => _appState;

  Sink<CartEvent> get sink => _eventStreamController.sink;

  Stream<AppState> get stream => _stateStreamController.stream;

  void _mapEventToSTate(CartEvent event){

    if(event is AddItemToCart){
      _addToCart(event);
    } else if (event is RemoveItemFromCart){
      _removeItemFromCart(event);
    } else if(event is ClearCart){
      _clearCart();
    }
      _stateStreamController.add(appState);
  }
  void _addToCart(AddItemToCart event) =>
      _appState.cardItems.add(event.id);

  void _removeItemFromCart(RemoveItemFromCart event) =>
      _appState.cardItems.remove(event.id);

  void _clearCart() => appState.cardItems.clear();

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}




