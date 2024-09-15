import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeController extends ChangeNotifier {
  List<Map<String, dynamic>> menuKeuangan = [];
  List<Map<String, dynamic>> menuKategori = [];
  List<Map<String, dynamic>> listNavBar = [
    {
      'icon': FeatherIcons.home,
      'label': 'Home',
      'badge': false,
      'route': '/home',
    },
    {
      'icon': FeatherIcons.search,
      'label': 'Cari',
      'badge': false,
      'route': '/cari',
    },
    {
      'icon': FeatherIcons.shoppingCart,
      'label': 'Keranjang',
      'badge': true,
      'route': '/keranjang',
    },
    {
      'icon': FeatherIcons.package,
      'label': 'Daftar Transaksi',
      'badge': false,
      'route': '/daftar_transaksi',
    },
    {
      'icon': FeatherIcons.percent,
      'label': 'Voucher',
      'badge': false,
      'route': '/voucher',
    },
    {
      'icon': FeatherIcons.mapPin,
      'label': 'Alamat Pengiriman',
      'badge': false,
      'route': '/alamat',
    },
    {
      'icon': FeatherIcons.users,
      'label': 'Daftar Teman',
      'badge': false,
      'route': '/daftar_teman',
    },
  ];

  bool isLoading = true;
  String error = '';

  HomeController() {
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      Future.wait([
        loadMenuKeuangan(),
        loadMenuKategori(),
      ]);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = 'Failed to load menu keuangan: $e';
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMenuKeuangan() async {
    String jsonString =
        await rootBundle.loadString('assets/json/menu_keuangan.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> dataList = jsonData['data'];

    menuKeuangan.clear();
    for (var item in dataList) {
      menuKeuangan.add(item as Map<String, dynamic>);
    }

    notifyListeners();
  }

  Future<void> loadMenuKategori() async {
    String jsonString =
        await rootBundle.loadString('assets/json/menu_kategori.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> dataList = jsonData['data'];

    menuKategori.clear();
    for (var item in dataList) {
      menuKategori.add(item as Map<String, dynamic>);
    }

    notifyListeners();
  }
}
