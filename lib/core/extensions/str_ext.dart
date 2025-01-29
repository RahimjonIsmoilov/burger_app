import 'package:burger_app/core/app_urls.dart';

extension StrExt on String? {
  String get image => "${AppUrls.baseUrl}/images/$this";
}
