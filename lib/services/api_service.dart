import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';

const baseUrl =
    'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

class ApiService {
  Future<List<Product>> getProductList(http.Client client) async {
    http.Response response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> products = jsonDecode(response.body);
      List<Product> makeUpList =
          products.map((product) => Product.fromJson(product)).toList();

      return makeUpList;
    } else {
      throw Exception('Not found');
    }
  }
}
