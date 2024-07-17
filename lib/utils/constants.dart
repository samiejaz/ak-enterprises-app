import 'dart:ui';

class Constants {
  static const Color bgColor = Color.fromRGBO(250, 250, 250, 1);
  static const Color textColor = Color.fromRGBO(0, 0, 0, 1);

  // static const Color primaryColor = Color.fromRGBO(250, 204, 21, 1);
  static const Color primaryColor = Color.fromRGBO(234, 179, 8, 1);

  static const Color secondaryColor = Color.fromRGBO(241, 245, 249, 1);
  static const Color dangerColor = Color(0xFFFF0000);
  static const Color accentColor = Color(0xFFFFC107);
}

class APIConstants {
  static const String baseUrl = 'http://192.168.7.7:131';
}

class SecureStorageKeys {
  static const String userId = "userid";
  static const String username = "username";
  static const String email = "email";
}
