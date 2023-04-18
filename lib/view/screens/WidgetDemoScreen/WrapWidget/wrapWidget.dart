import 'package:flutter/material.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

class WrapWidget extends StatefulWidget {
  @override
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  late BuildContext context; //global context

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wrap Widget',
          style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Without Wrap Widget',
                        style: GoogleFonts.fredoka(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12, top: 8),
                        child: Text(
                          'Here we observe that the layout is overflowing to the right, which breaks the widget.',
                          style: GoogleFonts.fredoka(
                            color: Colors.grey[400],
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                // THIS CREATE AN OVERFLOW ERROR (RIGHT OVERFLOWED BY '' PIXELS)
                Row(
                  children: <Widget>[
                    chipDesign("Chennai Super Kings", Color(0xfffacb03)),
                    chipDesign("Delhi Capitals", Color(0xffb9251d)),
                    chipDesign("Gujarat Titans", Color(0xff77c7f2)),
                    chipDesign("Kolkata Knight Riders", Color(0xffecc542)),
                    chipDesign("Lucknow Super Giants", Color(0xff2a49bf)),
                    chipDesign("Mumbai Indians", Color(0xff2d6ab1)),
                    chipDesign("Punjab Kings", Color(0xffd71920)),
                    chipDesign("Rajasthan Royals", Color(0xffeb83b5)),
                    chipDesign("Royal Challengers Bangalore", Color(0xff2b2a2a)),
                    chipDesign("Sunrisers Hyderabad", Color(0xfff26522)),
                  ],
                ),
              ],
            ),
            divider(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'With Wrap Widget',
                        style: GoogleFonts.fredoka(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12, top: 8),
                        child: Text(
                          'Here we observe that chips are contained inside the Wrap '
                          'widget. It adjusts all the children according to the space '
                          'and automatically wraps to the next line',
                          style: GoogleFonts.fredoka(
                            color: Colors.grey[400],
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                // WRAP WIDGET WILL HANDLE ITSELF TO AVOID OVERFLOW ERROR
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 0.0, // gap between adjacent chips
                  runSpacing: 0.0, // gap between lines
                  children: <Widget>[
                    chipDesign("Chennai Super Kings", Color(0xfffacb03)),
                    chipDesign("Delhi Capitals", Color(0xffb9251d)),
                    chipDesign("Gujarat Titans", Color(0xff77c7f2)),
                    chipDesign("Kolkata Knight Riders", Color(0xffecc542)),
                    chipDesign("Lucknow Super Giants", Color(0xff2a49bf)),
                    chipDesign("Mumbai Indians", Color(0xff2d6ab1)),
                    chipDesign("Punjab Kings", Color(0xffd71920)),
                    chipDesign("Rajasthan Royals", Color(0xffeb83b5)),
                    chipDesign("Royal Challengers Bangalore", Color(0xff2b2a2a)),
                    chipDesign("Sunrisers Hyderabad", Color(0xfff26522)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// METHOD TO DESIGN A CHIP WITH DIFFERENT PROPERTIES
Widget chipDesign(String label, Color color) => Container(
      child: Chip(
        label: Text(
          label,
          style: GoogleFonts.fredoka(color: Colors.white),
        ),
        backgroundColor: color,
        elevation: 4,
        shadowColor: Colors.grey[50],
        padding: EdgeInsets.all(4),
      ),
      margin: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
);

// METHOD TO CREATE A DIVIDER WITH ADDED MARGIN
Container divider(BuildContext context) => Container(
      child: Divider(),
      margin: EdgeInsets.only(left: 10, right: 10, top: 28, bottom: 28),
);
