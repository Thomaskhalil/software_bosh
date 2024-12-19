import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items
  final List _shopItems = [
    // [itemName, itemPrice, imagePath]
    ["Cookies", "5.50", "assets/images/cookies.png"],
    ["Bread", "10.33", "assets/images/product2.png"],
    ["CupCake", "2.76", "assets/images/cupcake.png"],
    ["Filled Bun", "7.88", "assets/images/product4.png"],
    ["Cinammon Roll", "5.50", "assets/images/cinnamon-roll.png"],
    ["Donuts", "5.50", "assets/images/donuts.png"],
    ["Croissant", "5.50", "assets/images/product7.png"],
    ["Oat Bagel", "5.50", "assets/images/product8.png"],
  ];

  //list of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  //add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String getTotalPrice() {
    double totalPrice = 0.0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
