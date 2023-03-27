import 'package:flutter/material.dart';

// IMPORTING ADAPTIVE CHAMELEON THEME
import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';

class AppThemes {
  // Red Theme Data
  static ThemeData redTheme() {
    return ThemeData(
      primarySwatch: Colors.red,
    );
  }

  static ThemeData redDarkTheme() {
    return ThemeData.from(
      colorScheme:
      const ColorScheme.dark(primary: Colors.red, secondary: Colors.red),
    );
  }

  // Blue Theme Data
  static ThemeData blueTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }

  static ThemeData blueDarkTheme() {
    return ThemeData.from(
      colorScheme:
      const ColorScheme.dark(primary: Colors.blue, secondary: Colors.blue),
    );
  }

  // Purple Theme Data
  static ThemeData purpleTheme() {
    return ThemeData(
      primarySwatch: Colors.purple,
    );
  }

  static ThemeData purpleDarkTheme() {
    return ThemeData.from(
      colorScheme: const ColorScheme.dark(
          primary: Colors.purple, secondary: Colors.purple),
    );
  }

  // Amber Theme Data
  static ThemeData amberTheme() {
    return ThemeData(
      primarySwatch: Colors.amber,
    );
  }

  static ThemeData amberDarkTheme() {
    return ThemeData.from(
      colorScheme: const ColorScheme.dark(
          primary: Colors.amber, secondary: Colors.amber),
    );
  }

  // Green Theme Data
  static ThemeData greenTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
    );
  }

  static ThemeData greenDarkTheme() {
    return ThemeData.from(
      colorScheme: const ColorScheme.dark(
          primary: Colors.green, secondary: Colors.green),
    );
  }

  static const int red = 0;
  static const int blue = 1;
  static const int purple = 2;
  static const int amber = 3;
  static const int green = 4;

  static String toStr(int themeId) {
    switch (themeId) {
      case red:
        return "Red";
      case blue:
        return "Blue";
      case purple:
        return "Purple";
      case amber:
        return "Amber";
      case green:
        return "Green";
      default:
        return "Unknown";
    }
  }

  static ThemeCollection themeCollection = ThemeCollection(
    themes: {
      red: redTheme(),
      blue: blueTheme(),
      purple: purpleTheme(),
      amber: amberTheme(),
      green: greenTheme(),
    },
    fallbackTheme: ThemeData.light(), // optional fallback theme, default value
  );

  static ThemeCollection darkThemeCollection = ThemeCollection(
    themes: {
      red: redDarkTheme(),
      blue: blueDarkTheme(),
      purple: purpleDarkTheme(),
      amber: amberDarkTheme(),
      green: greenDarkTheme(),
    },
    fallbackTheme: ThemeData.dark(), // optional fallback theme, default value
  );
}