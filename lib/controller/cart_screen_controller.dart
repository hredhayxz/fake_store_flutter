import 'package:fake_store_flutter/data/models/product_model.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  final List<ProductModel> _allCartProducts = [];
  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  List<ProductModel> get allCartProducts => _allCartProducts;

  void addProduct(ProductModel product) {
    if (product.quantity == 0) {
      ++product.quantity;
      _allCartProducts.add(product);
    } else {
      ++product.quantity;
    }
    _calculateTotalPrice();
    update();
  }

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

  void deleteProduct(ProductModel product) {
    product.quantity = 0;
    _allCartProducts
        .removeAt(_allCartProducts.indexWhere((p) => p.id == product.id));
    _calculateTotalPrice();

    update();
  }

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (var product in _allCartProducts) {
      _totalPrice += product.quantity * product.price!;
    }
  }
}
