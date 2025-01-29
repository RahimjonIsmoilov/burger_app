import 'dart:convert';

import 'package:burger_app/main_page/api/product_model.dart';
import 'package:http/http.dart' as http;
class ProductRepository {
  Future<List<ProductModel>> getData()async{
    List<ProductModel> productList=[];
    final url = Uri.parse("http://167.235.222.200:2003/product/get");
    try {
      final res = await http.get(url);
      final resData = json.decode(utf8.decode(res.bodyBytes));
      if (res.statusCode==200) {
        for (final item in resData) {
        productList.add(ProductModel.fromJson(item));
      }
      }
      else{
        throw Exception("Server error error code ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Server error $e");
    }
  return productList;
  }
}