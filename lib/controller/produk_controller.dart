import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive_flutter/hive_flutter.dart';

class ProductController extends ChangeNotifier {
  static const String boxName = 'productsBox';
  static const String productsKey = 'product_list';

  List<Map<String, dynamic>> listProduk = [];

  ProductController() {
    getAndPopulateProducts();
  }

  Future<void> saveProductsToHive(List<Map<String, dynamic>> products) async {
    final box = await Hive.openBox(boxName);
    await box.put(productsKey, json.encode(products));
  }

  Future<List<Map<String, dynamic>>> getProductsFromHive() async {
    final box = await Hive.openBox(boxName);
    final productsJson = box.get(productsKey);
    if (productsJson != null) {
      final List<dynamic> decodedData = json.decode(productsJson);
      return decodedData.cast<Map<String, dynamic>>();
    }
    return [];
  }

  Future<void> loadProductsFromJsonAndSaveToHive() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/list_produk.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> productList = jsonData['data'];
      final List<Map<String, dynamic>> products =
          productList.cast<Map<String, dynamic>>();
      await saveProductsToHive(products);
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  Future<void> getAndPopulateProducts() async {
    List<Map<String, dynamic>> listProdukStorage = await getProductsFromHive();
    if (listProdukStorage.isEmpty) {
      await loadProductsFromJsonAndSaveToHive();
      listProdukStorage = await getProductsFromHive();
    }

    listProduk = listProdukStorage;
    notifyListeners();
  }
}
