import 'package:flutter/material.dart';

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xE527D2D9),
);

ThemeData basicTheme() => ThemeData(
      textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 72, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: TextStyle(
              fontSize: 36, fontStyle: FontStyle.italic, color: Colors.white),
          bodyMedium:
              TextStyle(fontSize: 14, fontFamily: 'Hind', color: Colors.white),
          bodyLarge:
              TextStyle(fontSize: 14, fontFamily: 'Hind', color: Colors.white),
          bodySmall:
              TextStyle(fontSize: 14, fontFamily: 'Hind', color: Colors.white),
          labelSmall:
              TextStyle(fontSize: 14, fontFamily: 'Hind', color: Colors.white)),
      listTileTheme: const ListTileThemeData(
        tileColor: Color(0xE5EF0808),
      ),
      tabBarTheme: const TabBarTheme(),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: colorScheme.onPrimary,
        ),
        backgroundColor: colorScheme.secondary,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            colorScheme.primary,
          ),
          foregroundColor: MaterialStateProperty.all(
            colorScheme.onPrimary,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        contentTextStyle: TextStyle(
          color: colorScheme.onBackground,
        ),
      ),
      iconTheme: IconThemeData(
        color: colorScheme.secondary,
      ),
      colorScheme: colorScheme.copyWith(secondary: Colors.white54),
    );
