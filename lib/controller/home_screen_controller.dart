import 'package:fake_store_flutter/data/models/network_response.dart';
import 'package:fake_store_flutter/data/models/product_model.dart';
import 'package:fake_store_flutter/data/services/network_caller.dart';
import 'package:fake_store_flutter/data/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  bool _isProductFetching = false;

  final List<ProductModel> _allProducts = [];

  List<ProductModel> get allProducts => _allProducts;

  bool get isProductFetching => _isProductFetching;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getAllProducts();
    });
  }

  Future<void> getAllProducts() async {
    _isProductFetching = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.getAllProducts);
    if (response.isSuccess) {
      List<dynamic> dataList = response.responseJson;
      _allProducts.clear();
      for (var data in dataList) {
        _allProducts.add(ProductModel.fromJson(data));
      }
      _isProductFetching = false;
      update();
    } else {
      _isProductFetching = false;
      update();
    }
  }
}