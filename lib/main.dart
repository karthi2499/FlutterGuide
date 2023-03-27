import 'package:flutter/material.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_core/firebase_core.dart';

// IMPORTING SIZING
import 'package:sizing/sizing.dart';

// IMPORTING SERVICES
import 'package:flutterguide/service/authService.dart';

// IMPORTING VIEW/SCREENS
import 'package:flutterguide/view/screens/exportScreens.dart';

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
    return SizingBuilder(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthService().handleAuthState(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        title: 'Flutter Guide',
      ),
      systemFontScale: true,
    );
  }
}