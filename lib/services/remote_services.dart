import 'package:http/http.dart' as http;
import 'package:shop_x_flutter/models/product.dart';

class RemoteServies {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var res = await client.get(
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'));
    if (res.statusCode == 200) {
      var jsonString = res.body;
      return productFromJson(jsonString);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
