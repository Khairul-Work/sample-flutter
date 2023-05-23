import 'package:flutter/material.dart';
import 'package:sample/api/product.api.dart';

class ProductController {
  final ProductApi _productApi = ProductApi();

  Future<bool> isProductExist(int id) async {
    try {
      final res = await _productApi.isExist(id);
      return res;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
