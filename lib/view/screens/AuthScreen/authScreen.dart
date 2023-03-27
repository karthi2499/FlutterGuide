import 'dart:async';

import 'package:flutter/material.dart';

// IMPORTING ANIMATE DO PACKAGE
import 'package:animate_do/animate_do.dart';

// IMPORTING AUTH BUTTONS
import 'package:auth_buttons/auth_buttons.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING SERVICES
import 'package:flutterguide/service/authService.dart';

// IMPORTING VIEW/SCREENS
import 'package:flutterguide/view/screens/exportScreens.dart';

String name = '';
String email = '';
String image = '';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Swing(
              child: Image.asset("assets/logo_without_bg.png"),
            ),
            Bounce(
              child: Text(
                "Flutter Guide",
                style: GoogleFonts.fredoka(fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(48),
        child: GoogleAuthButton(
          onPressed: () {
            AuthService().signInWithGoogle();
          },
          text: "Continue with Google",
        ),
      ),
    );
  }
}