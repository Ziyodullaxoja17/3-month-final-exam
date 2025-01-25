import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkServiceCustom {
  // Sign in  bu yerda biz token ni "token" deb nomlangan sharef prefga saqlab olamiz;
  Future<Map<String, dynamic>> signIn({
    required String password,
    required String email,
  }) async {
    final url = Uri.parse("https://e-commerce.birnima.uz/api/auth/signin");

    log("network da sign in chaqirildi");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone_number":
              email, // bu yerda biz emali yoki raqam kiritsak ham bo'ladi , uni dimaik ko'rinishga almashriramiz
          "email": email,
          "auth_method": "email",
          "password": password,
        }),
      );

      if (response.statusCode == 201) {
        log("Ma'lumot olindi: ${response.body}");
        return jsonDecode(response.body);
      } else {
        log("Xatolik yuz berdi >> Status code: ${response.statusCode}");
        throw Exception("Xatolik yuz berdi: ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Sign in failed: ${e.toString()}");
    }
  }

  // Sign up bu yerda iz sign up qilgaminimizda olinga tokenni saqlab qo'yamiz
  Future<Map<String, dynamic>> signUp({
    required String password,
    required String email,
  }) async {
    final url = Uri.parse("https://e-commerce.birnima.uz/api/auth/signup");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone_number": email, // email ni raqam o'rniga ham bersak bo'ladi
          "email": email,
          "auth_method": "email",
          "password": password,
        }),
      );

      if (response.statusCode == 201) {
        log("Ma'lumot olindi: ${response.body}");
        return jsonDecode(response.body);
      } else {
        log("Xatolik yuz berdi >> Status code: ${response.statusCode}");
        throw Exception("Xatolik yuz berdi: ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Sign up failed: ${e.toString()}");
    }
  }

  // biz qo'limidagi token orqali ma'lumolarni olamiz ma'lumot mapda , key => ["data"] list qilin qaytarib yuborayapmiz
  Future<List<dynamic>?> getFurnitures() async {
    final url = Uri.parse("https://e-commerce.birnima.uz/api/products");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token") ?? "";

    if (token.isEmpty) {
      log("Token topilmadi, iltimos tizimga kiring.");
      throw Exception("Token mavjud emas.");
    }

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        log("Ma'lumot muvaffaqiyatli olindi.");
        log(result.toString());

        return result['data'];
      } else {
        log("Xatolik yuz berdi >> Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      throw Exception(
          "Ma'lumotlarni olishda xatolik yuzaga keldi: ${e.toString()}");
    }
  }
}
