import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class LocalDB {
  static late Box _box;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('data');
  }

  /// For all home screen product data
  //Store home product data
  static set homeProductData(dynamic productData) =>
      _box.put('allHomeProduct', jsonEncode(productData));

  // Get home product data
  static dynamic get homeProductData =>
      jsonDecode(_box.get('allHomeProduct') ?? '{}');

  /// For all cart product data
  //Store cart product data
  static set cartProductData(dynamic productData) =>
      _box.put('allCartProduct', jsonEncode(productData));

  // Get cart product data
  static dynamic get cartProductData =>
      jsonDecode(_box.get('allCartProduct') ?? '{}');
}
