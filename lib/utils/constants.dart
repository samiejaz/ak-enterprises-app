import 'dart:ui';

class Constants {
  static const Color bgColor = Color.fromRGBO(250, 250, 250, 1);
  static const Color textColor = Color.fromRGBO(0, 0, 0, 1);

  // static const Color primaryColor = Color.fromRGBO(250, 204, 21, 1);
  static const Color primaryColor = Color.fromRGBO(234, 179, 8, 1);

  static const Color secondaryColor = Color.fromRGBO(65, 105, 225, 1);
  static const Color dangerColor = Color(0xFFFF0000);
  static const Color accentColor = Color(0xFFFFC107);
}

class APIConstants {
  static const String baseUrl = 'https://e732-110-39-141-170.ngrok-free.app';
}

class SecureStorageKeys {
  static const String userId = "userid";
  static const String username = "username";
  static const String email = "email";
}
