import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/home/data/models/product_model.dart';

class RemoteData {
  Future<List<ProductModel>?> getPhones() async {
    const String apiUrl = "https://dummyjson.com/products/category/smartphones";
    final Dio dio = Dio();
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/phonesData.json");
    final response = await dio.get(apiUrl, options: Options(
        validateStatus: (status) {
          return status! < 500;
        }
    ));
    if(response.statusCode == 200) {
      file.writeAsStringSync(json.encode(response.data));
      return (response.data["products"] as List).map((value) => ProductModel.fromJson(value)).toList();
    }
    return null;
  }

  Future<List<ProductModel>?> getLaptops() async {
    const String apiUrl = "https://dummyjson.com/products/category/laptops";
    final Dio dio = Dio();
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/laptopsData.json");
    final response = await dio.get(apiUrl, options: Options(
        validateStatus: (status) {
          return status! < 500;
        }
    ));
    if(response.statusCode == 200) {
      file.writeAsStringSync(json.encode(response.data));
      return (response.data["products"] as List).map((value) => ProductModel.fromJson(value)).toList();
    }
    return null;
  }

  Future<List<ProductModel>?> searchProduct(String prompt) async {
    const String apiUrl = "https://dummyjson.com/products/search";
    final Dio dio = Dio();
    final response = await dio.get(apiUrl, queryParameters: {
      "q": prompt
    }, options: Options(
        validateStatus: (status) {
          return status! < 500;
        }
    ));
    if(response.statusCode == 200) {
      return (response.data["products"] as List).map((value) => ProductModel.fromJson(value)).toList();
    }
    return null;
  }
}