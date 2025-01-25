import 'dart:convert';

import 'package:burger_app/registration_page/api/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
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
}
