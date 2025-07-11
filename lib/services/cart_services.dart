import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class CartServices {
  var baseUrl = 'https://fakestoreapi.com/';

  getCartProduct() async {
    List<CartModel> cartProductList = [];
    try {
      var response = await http.get(Uri.parse(baseUrl + 'products'));
      if (response.statusCode == 200) {
        var data = response.body;
        var decodeData = jsonDecode(data);
        var products = decodeData;
        for (var product in products) {
          CartModel newCartProduct = CartModel.fromJson(product);
          cartProductList.add(newCartProduct);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
