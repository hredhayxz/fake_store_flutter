import 'package:fake_store_flutter/data/local_db/local_db.dart';
import 'package:fake_store_flutter/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  final List<ProductModel> _allCartProducts = [];
  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  List<ProductModel> get allCartProducts => _allCartProducts;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _makeData(dataList: LocalDB.cartProductData);
    });
    super.onInit();
  }

  // Add product method
  void addProduct(ProductModel product) {
    final existingProductIndex =
        _allCartProducts.indexWhere((p) => p.id == product.id);

    if ((product.quantity == 0) && (existingProductIndex == -1)) {
      ++product.quantity;
      _allCartProducts.add(product);
    } else {
      ++_allCartProducts[existingProductIndex].quantity;
    }
    _calculateTotalPrice();
    update();
  }

  // Remove product method
  void removeProduct(ProductModel product) {
    if (product.quantity == 1) {
      --product.quantity;
      _allCartProducts
          .removeAt(_allCartProducts.indexWhere((p) => p.id == product.id));
    } else {
      --product.quantity;
    }
    _calculateTotalPrice();

    update();
  }

  // Delete product method
  void deleteProduct(ProductModel product) {
    product.quantity = 0;
    _allCartProducts
        .removeAt(_allCartProducts.indexWhere((p) => p.id == product.id));
    _calculateTotalPrice();

    update();
  }

  // Calculate total price
  void _calculateTotalPrice() {
    _addLocalDB();
    _totalPrice = 0;
    for (var product in _allCartProducts) {
      _totalPrice += product.quantity * product.price!;
    }
  }

  // Add cart data into local db
  void _addLocalDB() {
    LocalDB.cartProductData = _allCartProducts;
  }

  void _makeData({required dynamic dataList}) {
    _allCartProducts.clear();
    for (var data in dataList) {
      _allCartProducts.add(ProductModel.fromJson(data));
    }
    update();
  }
}
