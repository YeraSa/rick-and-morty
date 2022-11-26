import 'package:flutter/material.dart';

enum AppTheme {
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black54,
    ),
    backgroundColor: Colors.black87,
    cardColor: const Color.fromRGBO(86, 86, 86, 0.8),
    indicatorColor: Colors.white,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
      headline3: TextStyle(fontSize: 24, color: Colors.white),
      bodyText1: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w200, color: Colors.white),
      bodyText2: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      caption: TextStyle(
          fontSize: 11, fontWeight: FontWeight.w100, color: Colors.grey),
    ),
  ),
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(210, 211, 219, 0.8),
    ),
    backgroundColor: const Color.fromRGBO(228, 229, 241, 0),
    cardColor: const Color.fromRGBO(210, 211, 219, 0.8),
    indicatorColor: const Color.fromRGBO(72, 75, 106, 1),
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(72, 75, 106, 1)),
      headline2: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(72, 75, 106, 1)),
      headline3: TextStyle(fontSize: 24, color: Color.fromRGBO(72, 75, 106, 1)),
      bodyText1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          color: Color.fromRGBO(72, 75, 106, 1)),
      bodyText2: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(72, 75, 106, 1)),
      caption: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w100,
          color: Colors.grey),
    ),
  ),
};
