import 'package:flutter/material.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

class ExpandedWidget extends StatefulWidget {
  @override
  _ExpandedWidgetState createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  // FLEX FACTOR FOR 1ST WIDGET
  int _flexFactor0 = 1;
  // FLEX FACTOR FOR 2ND WIDGET
  int _flexFactor1 = 2;
  // FLEX FACTOR FOR 3RD WIDGET
  int _flexFactor2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expanded Widget',
          style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 2,
                child: Row(
                  children: <Widget>[
                    // 1ST FLEXIBLE WIDGET
                    Expanded(
                      flex: _flexFactor0,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: GestureDetector(
                          child: Container(
                            child: Center(
                              child: Text(
                                'Touch Me',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 10),
                              ),
                            ),
                            margin: const EdgeInsets.all(10.0),
                            color: const Color(0xFF2196f3),
                            width: 48.0,
                            height: 48.0,
                          ),
                          onTap: () => setState(() {
                            _flexFactor0++;
                          }),
                        ),
                      ),
                    ),
                    // 2ND FLEXIBLE WIDGET
                    Expanded(
                      flex: _flexFactor1,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: GestureDetector(
                          child: Container(
                            child: Center(
                              child: Text(
                                'Touch Me',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 11.5),
                              ),
                            ),
                            margin: const EdgeInsets.all(10.0),
                            color: const Color(0xFF673ab7),
                            width: 48.0,
                            height: 48.0,
                          ),
                          onTap: () => setState(() {
                            _flexFactor1++;
                          }),
                        ),
                      ),
                    ),
                    // 3RD FLEXIBLE WIDGET
                    Expanded(
                      flex: _flexFactor2,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: GestureDetector(
                          child: Container(
                            child: Center(
                              child: Text(
                                'Touch Me',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 10),
                              ),
                            ),
                            margin: const EdgeInsets.all(10.0),
                            color: const Color(0xFF009688),
                            width: 48.0,
                            height: 48.0,
                          ),
                          onTap: () => setState(() {
                            _flexFactor2++;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // NOTE
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text('Note: Touch each container to experience Expanded Widget', style: GoogleFonts.fredoka(fontSize: 14),),
            ),
            // CLICK ON THIS BUTTON TO RESET THE FLEX VALUES
            Container(
              margin: EdgeInsets.all(16.0),
              child: OutlinedButton(
                onPressed: () => setState(() {
                  _flexFactor0 = 1;
                  _flexFactor1 = 2;
                  _flexFactor2 = 1;
                }),
                child: Text('Reset', style: GoogleFonts.fredoka(),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}