import '../models/productModel.dart';
import 'package:flutter/foundation.dart';

class productProvider with ChangeNotifier {
  final List<productModel> _products = [
    productModel(
        id: '1',
        name: "AKG N700NCM2 Wireless Headphones",
        price: 254,
        assetName: 'assets/headphone.png',
        isAvailable: true),
    productModel(
        id: '2',
        name: "Aple Airpods Max Wireless Headphones",
        price: 350,
        assetName: 'assets/airpods.png',
        isAvailable: false),
    productModel(
        id: '3',
        name: "AKG N700NCM2 Wireless Headphones",
        price: 175,
        assetName: 'assets/headphone.png',
        isAvailable: true),
    productModel(
        id: '4',
        name: "AKG N700NCM2 Wireless Headphones",
        price: 985,
        assetName: 'assets/headphone.png',
        isAvailable: true),
  ];
  //getter to get this list
  List<productModel> get products => _products;



  final List<productModel> _accessories = [
    productModel(
        id: '5',
        name: "Apple Homepod mini",
        price: 254,
        assetName: 'assets/homepod.png',
        isAvailable: true),
    productModel(
        id: '6',
        name: "AKG N700NCM2 Wireless Headphones",
        price: 350,
        assetName: 'assets/headphone.png',
        isAvailable: false),
    productModel(
        id: '7',
        name: "AKG N700NCM2 Wireless Headphones",
        price: 175,
        assetName: 'assets/headphone.png',
        isAvailable: true),
    productModel(
        id: '8',
        name: "AKG N700NCM2 Wireless Headphones",
        price: 985,
        assetName: 'assets/headphone.png',
        isAvailable: true),
  ];
  List<productModel> get accessories => _accessories;


  productModel getitembyId(String id)
  {
    return _products.firstWhere((product) =>product.id == id);
  }
}
