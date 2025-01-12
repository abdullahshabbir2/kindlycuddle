import 'package:cuddle_care/Constants/font_family_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    fontFamily: FontFamilyConstants.fontFamilyConstant,
    brightness: Brightness.light,
    colorScheme:
        const ColorScheme.light(surface: Color.fromRGBO(239, 250, 252, 1)));

ThemeData darkMode = ThemeData(
    fontFamily: FontFamilyConstants.fontFamilyConstant,
    brightness: Brightness.dark,
    colorScheme:
        const ColorScheme.dark(surface: Color.fromRGBO(39, 39, 39, 1)));
