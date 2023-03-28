import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// IMPORTING ADAPTIVE CHAMELEON THEME
import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_core/firebase_core.dart';

// IMPORTING SERVICES
import 'package:flutterguide/service/authService.dart';

// IMPORTING UTILS/THEME
import 'package:flutterguide/utils/AppTheme/appTheme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlutterGuide());
}

class FlutterGuide extends StatelessWidget {
  const FlutterGuide({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveChameleonThemeWidget(
        themeCollection: AppThemes.themeCollection,
        darkThemeCollection: AppThemes.darkThemeCollection,
        defaultThemeId: AppThemes.blue,
        builder: (context, theme, darkTheme, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthService().handleAuthState(),
            darkTheme: darkTheme,
            theme: theme,
            themeMode: themeMode,
            title: 'Flutter Guide',
          );
        }
    );
  }
}