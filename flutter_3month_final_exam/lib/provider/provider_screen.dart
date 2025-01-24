import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_3month_final_exam/data/models/furniture_model.dart';
import 'package:flutter_3month_final_exam/data/service/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderScreen extends ChangeNotifier {
  final NetworkServiceCustom networkService;

  ProviderScreen({required this.networkService});

  bool isLoading = false;
  List<Furniture> furnitures = [];

  void refresh() {
    notifyListeners();
  }

// ro'yxatdan o'tish uchun providerdan ma'lumotlani yuborish va providerda tokenni xotiraga saqlab qo'yaiz
  Future<bool> register(
      {required String password, required String email}) async {
    try {
      final token_map =
          await networkService.signUp(password: password, email: email);

      final token = token_map["data"]["access_token"];
      log("token => ${token}");

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      log("token saqlandi");
      return true;
    } catch (e) {
      return false;
    }
  }

// login qilib kirilganda ham token beriladi va uni sharedpre saqlab olamiz
  Future<bool> login({required String password, required String email}) async {
    try {
      final token_map =
          await networkService.signIn(password: password, email: email);

      final token = token_map["data"]["access_token"];
      log("token => ${token}");

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      log("token saqlandi");
      return true;
    } catch (e) {
      return false;
    }
  }

  // API dan barcha  Furniture larni olish

  Future<void> fetchFurniture() async {
    isLoading = true;
    notifyListeners();

    final result = await networkService.getFurnitures();

    furnitures =
        result!.map((furiniture) => Furniture.fromJson(furiniture)).toList();
    isLoading = false;
    notifyListeners();
  }
}
