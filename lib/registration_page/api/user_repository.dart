import 'dart:convert';

import 'package:burger_app/core/app_urls.dart';
import 'package:burger_app/registration_page/api/user_locale_repository.dart';
import 'package:burger_app/registration_page/api/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final UserLocaleRepository userLocaleRepository = UserLocaleRepository();
  Future<List<UserModel>> getData() async {
    List<UserModel> userList = [];
    final url = Uri.parse("http://167.235.222.200:2003/users/get");
    try {
      final res = await http.get(url);
      final resData = json.decode(utf8.decode(res.bodyBytes));
      if (res.statusCode == 200) {
        for (final item in resData) {
          userList.add(UserModel.fromJson(item));
        }
      } else {
        throw Exception("Server error error code ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Server error $e");
    }
    return userList;
  }

  Future<bool> login(UserModel model) async {
    List<UserModel> userList = [];
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
}
