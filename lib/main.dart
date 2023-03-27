import 'package:flutter/material.dart';

// IMPORTING SIZING
import 'package:sizing/sizing.dart';

// IMPORTING VIEW/SCREENS
import 'package:flutterguide/view/screens/exportScreens.dart';

void main() {
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
        home: const SpalshScreen(),
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