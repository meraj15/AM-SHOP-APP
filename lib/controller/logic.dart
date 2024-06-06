import 'dart:convert';

import 'package:am_shops/model/api_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

class LogicAPI {
  static Future<Either<String, List<ProductData>>> getDetailProduct() async {
    try {
      Response response =
          await get(Uri.parse("https://fakestoreapi.com/products"));
      final mapResponse = jsonDecode(response.body);
      List<ProductData> usersList = [];
      for (int i = 0; i < mapResponse.length; i++) {
        usersList.add(ProductData.fromMap(mapResponse[i]));
      }

      return right(usersList);
    } catch (e) {
      return left("Server down !! $e");
    }
  }
}
