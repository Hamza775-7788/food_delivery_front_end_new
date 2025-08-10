import 'package:flutter/material.dart';

const Color priamryColor = Color(0xffFE8C00);
const Color scColor = Color(0xff878787);

ThemeData ligthTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    elevation: 0,

    backgroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.light(
    surface: Colors.white,

    primary: priamryColor,
    secondary: scColor,
  ),
);
