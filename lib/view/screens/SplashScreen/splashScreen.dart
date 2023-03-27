import 'dart:async';

import 'package:flutter/material.dart';

// IMPORTING ANIMATE DO PACKAGE
import 'package:animate_do/animate_do.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING VIEW/SCREENS
import 'package:flutterguide/view/screens/exportScreens.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Swing(
              child: Image.asset("assets/logo_without_bg.png"),
            ),
          ),
          Center(
            child: Bounce(
              child: Text(
                "Flutter Guide",
                style: GoogleFonts.ubuntu(fontSize: 26),
              ),
            )
          )
        ],
      )
    );
  }
}