
import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/model/catalog_item.dart';
import 'package:bloc/bloc.dart';

class AppStateBloc extends Bloc<CartEvent, AppState> {
   AppState get _appState  => state;

  AppStateBloc(AppState appState) : super(appState){
    on<AddItemToCart>((event, emit) {
      List<int> updateCartItemsIds = List.from(_appState.cartItems)..add(event.id);
      emit(_appState.copyWith(
          cartItems: updateCartItemsIds));
    });

    on<RemoveItemFromCart>((event, emit) {
      List<int> updateCartItemsIds = List.from(_appState.cartItems)..remove(event.id);
      emit(_appState.copyWith(
          cartItems: updateCartItemsIds));
    });

    on<ClearCart>((event, emit) {
      emit(_appState.copyWith(cartItems: []));
    });
  }
}

class AppState {
  final List<CatalogModel> catalog;
  final List<int> cartItems;

  AppState._(this.catalog, this.cartItems);

  factory AppState.initial() {
    List<CatalogModel> catalog = GenerateItems().generateItems(15);
    return AppState._(catalog, []);
  }

  AppState copyWith({
    required List<int> cartItems,
  }) {
    return AppState._(catalog, cartItems);
  }

  List<CatalogModel> get inCart =>
      catalog.where((element) => cartItems.contains(element.id)).toList();

  bool isInCart(int id) => cartItems.contains(id);

  int get price => inCart.fold(0, (sum, element) => sum + element.price);
}

abstract class CartEvent {}

class AddItemToCart extends CartEvent {
  final int id;

  AddItemToCart(this.id);
}

class RemoveItemFromCart extends CartEvent {
  final int id;
  RemoveItemFromCart(this.id);
}
class ClearCart extends CartEvent{}
