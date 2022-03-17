abstract class CartEvent {}

class AddItemToCart extends CartEvent{
  final int id;
  AddItemToCart(this.id);
}

class RemoveItemFromCart extends CartEvent{
  final int id;
  RemoveItemFromCart(this.id);
}

class ClearCart extends CartEvent{
}