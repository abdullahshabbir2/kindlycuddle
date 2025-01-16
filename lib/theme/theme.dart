import 'package:cuddle_care/Constants/font_family_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: FontFamilyConstants.fontFamilyConstant,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromRGBO(239, 250, 252, 1),
    onSurface: Color.fromRGBO(255, 255, 255, 0.6),
    //text colors
    primary: Color(0xFF222222),
    onSecondaryFixed: Color.fromARGB(255, 92, 92, 92),
    onPrimaryFixed: Color(0xFFB2CBF2),
    //
    onPrimary: Color.fromRGBO(171, 230, 237, 1),
    secondary: Color.fromRGBO(171, 230, 237, 0.5),
    onSecondary: Color.fromRGBO(208, 226, 246, 1),
  ),
);

ThemeData darkMode = ThemeData(
    fontFamily: FontFamilyConstants.fontFamilyConstant,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Color.fromRGBO(39, 39, 39, 1),
      onSurface: Color.fromRGBO(255, 255, 255, 0.3),
      //text colors
      primary: Color.fromARGB(255, 230, 229, 229),
      onSecondaryFixed: Color.fromARGB(255, 223, 223, 223),
      onPrimaryFixed: Color.fromRGBO(172, 143, 255, 1),
      //
      onPrimary: Color.fromRGBO(172, 143, 255, 1),
      secondary: Color.fromRGBO(172, 143, 255, 0.49),
      onSecondary: Color.fromRGBO(255, 255, 255, 0.3),
    ));
