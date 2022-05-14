import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:shop_x_flutter/models/product.dart';
import 'package:shop_x_flutter/services/remote_services.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  void fetchProducts() async {
    var products = await RemoteServies.fetchProducts();
    try {
      this.products.value = products;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
