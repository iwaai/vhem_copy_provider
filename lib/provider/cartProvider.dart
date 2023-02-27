import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/cartItemModel.dart';

class Cart with ChangeNotifier{
  // cart initialized
  Map<String, cartItemModel> _items ={};


  Map<String, cartItemModel> get items{
    return {..._items};
  }


  // add item to cart
  void additem(String productID, double price,String title,String imageP)
  {
    if (_items.containsKey(productID))
    {
      _items.update(productID,
      (existingItem) => cartItemModel(id: existingItem.id,image: existingItem.image, title: existingItem.title, quantity: existingItem.quantity + 1, price: existingItem.price));
    }
    else {_items.putIfAbsent(productID,
     () => cartItemModel(id: DateTime.now().toString(),image: imageP, title: title, quantity: 1, price: price));}

    notifyListeners();

  }


  void deleteItem(String Pid)
  {

    _items.remove(Pid);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
}