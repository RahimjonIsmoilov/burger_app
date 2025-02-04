import 'dart:convert';
import 'package:burger_app/core/app_urls.dart';
import 'package:burger_app/registration_page/api/user_locale_repository.dart';
import 'package:burger_app/registration_page/api/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final UserLocaleRepository userLocaleRepository = UserLocaleRepository();

  Future<bool> login(UserModel model) async {
    final url = Uri.parse(AppUrls.login);
    try {
      final res = await http.post(
        url,
        body: {
          "username": model.email,
          "password": model.password,
        },
      );
      final resData = json.decode(res.body);
      if (res.statusCode == 200) {
        final String? token = resData['access_token'];
        if (token != null) {
          await userLocaleRepository.saveUserLocale(token);
        }
        return true;
      } else {
        throw Exception("Server error error code ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Server error $e");
    }
  }

  Future<bool> registration(UserModel model) async {
    final url = Uri.parse(AppUrls.register);
    try {
      final res = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": model.name,
          "password": model.password,
          "email": model.email,
          "address": model.address,
          "phone_number": model.phonenumber,
        }),
      );

      // Server javobini chop etish
      debugPrint("Server Response Status Code: ${res.statusCode}");
      debugPrint("Server Response Body: ${res.body}");

      if (res.statusCode == 200) {
        final resData = json.decode(res.body);
        final String? token = resData['access_token'];
        if (token != null) {
          await userLocaleRepository.saveUserLocale(token);
        }
        return true;
      } else {
        throw Exception(
            "Server error code: ${res.statusCode}, Message: ${res.body}");
      }
    } catch (e) {
      debugPrint("Error during registration: $e");
      throw Exception("Server error: $e");
    }
  }
}
