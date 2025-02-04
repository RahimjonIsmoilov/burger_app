import 'dart:convert';
import 'package:burger_app/core/app_urls.dart';
import 'package:burger_app/main_page/api/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>> getData() async {
    List<ProductModel> productList = [];
    final url = Uri.parse(AppUrls.getProducts(1));

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        // UTF-8 formatda dekodlash
        final decodedData = utf8.decode(res.bodyBytes);
        final resData = json.decode(decodedData);

        for (final item in resData["products"]) {
          productList.add(ProductModel.fromJson(item));
        }
      } else {
        throw Exception("Server error: status code ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Server error: $e");
    }

    return productList;
  }
}
