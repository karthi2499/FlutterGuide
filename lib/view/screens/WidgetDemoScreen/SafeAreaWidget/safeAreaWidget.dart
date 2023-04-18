import 'package:flutter/material.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

class SafeAreaWidget extends StatefulWidget {
  @override
  _SafeAreaWidgetState createState() => _SafeAreaWidgetState();
}

class _SafeAreaWidgetState extends State<SafeAreaWidget> {
  // BOOL VALUE TO CONTROL THE BEHAVIOUR OF SAFEAREA WIDGET
  bool _isEnabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: _isEnabled,
        bottom: _isEnabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Text(
                "This widget is below SafeArea. If you remove the SafeArea widget then this text will appear behind the notch.",
                textAlign: TextAlign.center,
                style: GoogleFonts.fredoka(color: Colors.white),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // PRESS THIS BUTTON TO TOGGLE THE VALUE OF "_isEnabled" VARIABLE
                OutlinedButton(
                  onPressed: () => setState(() {
                    _isEnabled == true ? _isEnabled = false : _isEnabled = true;
                  }),
                  child: Text(_isEnabled ? "Disable SafeArea" : "Enable SafeArea", style: GoogleFonts.fredoka(),),
                ),

                SizedBox(width: 16,),

                // GO BACK TO DASHBOARD
                OutlinedButton(
                  onPressed: () => setState(() {
                    Navigator.pop(context);
                  }),
                  child: Text("Go Back", style: GoogleFonts.fredoka(),),
                ),
              ],
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Text(
                "This widget is above SafeArea",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}