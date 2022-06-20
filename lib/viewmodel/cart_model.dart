import 'package:flutter/material.dart';
import '../model/product.dart';

class CartModel extends ChangeNotifier {
   List<Product> _cart = [];
  double price = 0;

  int get cartValue {
    return _cart.length;
  }

  List<Product> get cart {
    return _cart;
  }
    void setCart(List<Product> list){
    _cart= list;
  }


  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  double getPrice() {
    price = 0;
    for (var element in _cart) {
      price += double.parse(element.price ?? '0');
    }
    notifyListeners();
    return price;
  }
}
