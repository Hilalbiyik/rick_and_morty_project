import 'package:flutter/material.dart';

class AppColor {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.purple,
      primary: const Color(0xFF9833FF),
      secondary: const Color(0xFF00D29B),
      background: const Color(0xFFFFFFFF));
  static final Color textColor = Color(0xFF222222);
  static final Color lighttextColor = Color(0xFFfffaf2);
  static final Color textColorDark = Color(0xFFFFFFFF);
  static final Color boxColor = Color(0xFF989efa);
  static final Color backgroundDark = Color(0xff57579f);
}

class ConstantsAdress {
  static const String apiUrl = "https://rickandmortyapi.com/api/character";
  static const String search = "Search";
  static const String appTitle = "Rick and Morty";
  static const String detailappTitle = "Detail Page";
}
