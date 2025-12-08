import 'package:flutter/foundation.dart';
import '../models/food_item.dart';

class CartItem {
  final FoodItem foodItem;
  int quantity;

  CartItem({required this.foodItem, this.quantity = 1});

  double get totalPrice => foodItem.price * quantity;
}

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();

  factory CartService() {
    return _instance;
  }

  CartService._internal();

  static CartService get instance => _instance;

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get totalPrice =>
      _items.fold(0, (total, current) => total + current.totalPrice);

  int get itemCount => _items.fold(0, (count, item) => count + item.quantity);

  void addToCart(FoodItem item) {
    for (var cartItem in _items) {
      if (cartItem.foodItem.id == item.id) {
        cartItem.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(foodItem: item));
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    _items.removeWhere((cartItem) => cartItem.foodItem.id == item.id);
    notifyListeners();
  }

  void increment(FoodItem item) {
    addToCart(item);
  }

  void decrement(FoodItem item) {
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].foodItem.id == item.id) {
        _items[i].quantity--;
        if (_items[i].quantity <= 0) {
          _items.removeAt(i);
        }
        notifyListeners();
        return;
      }
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
