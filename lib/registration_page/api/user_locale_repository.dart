import 'package:burger_app/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocaleRepository {
  Future<void> saveUserLocale(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(LocaleKeys.auth, token);
  }

  Future<String> getUserLocale() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(LocaleKeys.auth) ?? '';
  }
}
