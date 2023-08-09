import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.grey,
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),
          backgroundColor: Colors.blueGrey[100],
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
    iconTheme: const IconThemeData(
      color: Colors.grey
    )
  );
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
              color: Colors.white
          ),
          backgroundColor: Colors.blueGrey[900],
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      iconTheme: const IconThemeData(
          color: Colors.grey
      )
  );
}
