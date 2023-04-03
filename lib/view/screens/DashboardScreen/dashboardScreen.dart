import 'dart:convert';

import 'package:flutter/material.dart';

// IMPORTING ADAPTIVE CHAMELEON THEME
import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_auth/firebase_auth.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING HTTP
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';

// CLASS WIDGET MODEl
class WidgetModel {
  final String id;
  final String widgetName;
  final String widgetCategory;
  final String widgetDescription;
  final String widgetCode;

  WidgetModel({
    required this.id,
    required this.widgetName,
    required this.widgetCategory,
    required this.widgetDescription,
    required this.widgetCode,
  });

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    return WidgetModel(
      id: json['_id'],
      widgetName: json['widgetName'],
      widgetCategory: json['widgetCategory'],
      widgetDescription: json['widgetDescription'],
      widgetCode: json['widgetCode'],
    );
  }
}

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

  List<WidgetModel> _widgets = [];

  @override
  void initState() {
    super.initState();
    _fetchWidgets();
  }

  void _fetchWidgets() async {
    var response = await http.get(Uri.parse('https://flutterguide-widgets-api.onrender.com/api/widget/list'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['result'] as List<dynamic>;
      setState(() {
        _widgets = data.map((json) => WidgetModel.fromJson(json)).toList();
      });
    } else {
      print('Failed to fetch widgets');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    dropdownValue = AdaptiveChameleonTheme.of(context).themeId;
    themeModeDropdownValue = AdaptiveChameleonTheme.of(context).themeMode!;

    if(themeModeDropdownValue.index == 2) {
      return Scaffold(
        body: _widgets.isNotEmpty
            ? Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: _widgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: ListTile(
                                title: Text(
                                    _widgets[index].widgetName,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.fredoka(fontSize: 20)
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text(
                                      _widgets[index].widgetCategory,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.fredoka()
                                  ),
                                ),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.info_outline_rounded),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  _widgets[index].widgetName,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.fredoka()
                                              ),
                                              content: Text(
                                                  _widgets[index].widgetDescription,
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
                                      icon: Icon(Icons.info_outline_rounded),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Text(
                                                  _widgets[index].widgetCode,
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
                                  ],
                                )
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
            : Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        body: _widgets.isNotEmpty
            ? Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: _widgets.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                            title: Text(
                                _widgets[index].widgetName,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.fredoka(fontSize: 20)
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                  _widgets[index].widgetCategory,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.fredoka()
                              ),
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.info_outline_rounded),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              _widgets[index].widgetName,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.fredoka()
                                          ),
                                          content: Text(
                                              _widgets[index].widgetDescription,
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
                              ],
                            )
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        )
            : Center(child: CircularProgressIndicator()),
      );
    }
  }
}
