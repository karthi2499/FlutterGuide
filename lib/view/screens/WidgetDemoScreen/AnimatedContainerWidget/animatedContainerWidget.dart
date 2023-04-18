import 'package:flutter/material.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Alignment _alignment = Alignment.center;
  double _animatedHeight = 200.0;
  double _animatedWidth = 400.0;
  double _iconHeight = 180.0;
  double _iconWidth = 180.0;
  Color _animatedColor = Colors.red;
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animated Container Widget',
          style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24),
          child: Center(
            // ANIMATED CONTAINER IS USED TO CHANGE THE BACKGROUND COLOR WITH AN ANIMATION
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: _animatedWidth,
              height: _animatedHeight,
              color: _animatedColor,
              curve: Curves.fastOutSlowIn,
              // ANIMATED CONRAINER CHANGES THE ALIGNMENT OF FLUTTER LOGO WITH AN ANIMATION
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                alignment: _alignment,
                // ANIMATED CONTAINER CHANGES THE DIMENSIONS OF FLUTTER LOGO WITH AN ANIMATION
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  height: _iconHeight,
                  width: _iconWidth,
                  child: FlutterLogo(
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () => setState(() {
          // CONDITION TO TOGGLE "_isAnimated" VARIABLE
          _animatedWidth == 400.0
              ? _isAnimated = true
              : _isAnimated = false;
          // CONDITION TO CHANGE THE ALIGNMENT OF FLUTTER LOGO
          _isAnimated
              ? _alignment = Alignment.topCenter
              : _alignment = Alignment.center;
          // CONDITION TO CHANGE THE WIDTH OF THE BACKGROUND CONTAINER
          _isAnimated ? _animatedWidth = 200.0 : _animatedWidth = 400.0;
          // CONDITION TO CHANGE THE HEIGHT OF THE BACKGROUND CONTAINER
          _isAnimated
              ? _animatedHeight = MediaQuery.of(context).size.height - 200
              : _animatedHeight = 200.0;
          // CONDITION TO CHANGE THE BACKGROUND COLOR
          _isAnimated
              ? _animatedColor = Colors.lightBlue
              : _animatedColor = Colors.red;
          // CONDITION TO CHANGE THE WIDTH OF FLUTTER LOGO
          _isAnimated ? _iconWidth = 100.0 : _iconWidth = 180.0;
          // CONDITION TO CHANGE THE HEIGHT OF FLUTTER LOGO
          _isAnimated ? _iconHeight = 100.0 : _iconHeight = 180.0;
        }),
        icon: Icon(
          Icons.movie_filter,
          color: Colors.white,
        ),
        label: Text(
          "Animate",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}