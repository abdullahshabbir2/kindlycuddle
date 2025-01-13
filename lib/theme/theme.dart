import 'package:cuddle_care/Constants/font_family_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: FontFamilyConstants.fontFamilyConstant,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromRGBO(239, 250, 252, 1),
    onSurface: Color.fromRGBO(255, 255, 255, 0.6),
    primary: Color(0xFF222222),
  ),
);

ThemeData darkMode = ThemeData(
    fontFamily: FontFamilyConstants.fontFamilyConstant,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Color.fromRGBO(39, 39, 39, 1),
      onSurface: Color.fromRGBO(255, 255, 255, 0.3),
      primary: Color.fromARGB(255, 230, 229, 229),
    ));
