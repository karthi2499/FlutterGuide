import 'dart:convert';

import 'package:flutter/material.dart';

// IMPORTING ADAPTIVE CHAMELEON THEME
import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

// IMPORTING FLUTTER HIGHLIGHT
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github-gist.dart';
import 'package:flutter_highlight/themes/github.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING ICONS
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

// IMPORTING HTTP
import 'package:http/http.dart' as http;

// IMPORTING SHARE
import 'package:share/share.dart';

// IMPORTING URL LAUNCHER
import 'package:url_launcher/url_launcher.dart';

// IMPORTING WIDGET DEMO SCREENS
import 'package:flutterguide/view/screens/WidgetDemoScreen/exportWidgetDemoScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? user = FirebaseAuth.instance.currentUser!.email ??
      FirebaseAuth.instance.currentUser!.displayName;

  int dropdownValue = 0;
  ThemeMode themeModeDropdownValue = ThemeMode.system;

  List<dynamic> _widgets = [];

  Future<void> _fetchWidgets() async {
    final response = await http.get(Uri.parse(
        'https://flutterguide-widgets-api.onrender.com/api/widget/list'));
    final jsonData = jsonDecode(response.body);
    setState(() {
      _widgets = jsonData['result'];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _widgets.length,
              itemBuilder: (context, index) {
                final widgetData = _widgets[index];
                return Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 4),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(
                        widgetData['widgetName'],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.fredoka(fontSize: 16)
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                            widgetData['widgetCategory'],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.fredoka(fontSize: 12)
                        ),
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            icon: Icon(Iconsax.info_circle),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        widgetData['widgetName'],
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.fredoka()
                                    ),
                                    content: Text(
                                        widgetData['widgetDescription'],
                                        maxLines: 10,
                                        style: GoogleFonts.fredoka()
                                    ),
                                    actions: <Widget>[
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Iconsax.code),
                            onPressed: () {
                              _showCodeSheet(context, widgetData['widgetCode']);
                            },
                          ),
                          IconButton(
                            icon: Icon(Iconsax.play_circle),
                            onPressed: () {
                              if(widgetData['widgetName'] == "SafeArea") {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                              } else if(widgetData['widgetName'] == "Expanded") {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandedWidget()));
                              } else if(widgetData['widgetName'] == "Wrap") {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WrapWidget()));
                              } else if(widgetData['widgetName'] == "AnimatedContainer") {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedContainerWidget()));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                          widgetData['widgetName'],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.fredoka()
                                      ),
                                      content: Text(
                                          "Widget Demo Coming Soon!",
                                          maxLines: 10,
                                          style: GoogleFonts.fredoka()
                                      ),
                                      actions: <Widget>[
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.youtube),
                            onPressed: () async {
                              await launchUrl(Uri.parse(widgetData["widgetURL"]));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
  void _showCodeSheet(BuildContext context, String widgetCode) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 500,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/indicator.png", width: 24,)
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: widgetCode));
                        },
                        icon: Icon(Iconsax.copy),
                        label: Text("Copy", style: GoogleFonts.fredoka(),)
                    ),
                    SizedBox(width: 16,),
                    OutlinedButton.icon(
                        onPressed: () {
                          Share.share(widgetCode);
                        },
                        icon: Icon(Iconsax.share),
                        label: Text("Share", style: GoogleFonts.fredoka(),)
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: HighlightView(
                      '''${widgetCode}''',
                      padding: EdgeInsets.all(16),
                      language: "dart",
                      textStyle: GoogleFonts.fredoka(),
                      theme: githubGistTheme,
                      tabSize: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        // return SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Column(
        //     children: [
        //       SizedBox(height: 8,),
        //       Image.asset("assets/indicator.png", width: 24,),
        //       Container(
        //         padding: EdgeInsets.all(16),
        //         child: SingleChildScrollView(
        //           child: HighlightView(
        //             '''${widgetCode}''',
        //             padding: EdgeInsets.all(16),
        //             language: "dart",
        //             textStyle: GoogleFonts.fredoka(),
        //             theme: githubGistTheme,
        //             tabSize: 2,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // );
      },
    );
  }
}
