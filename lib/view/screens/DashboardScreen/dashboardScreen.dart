import 'package:flutter/material.dart';

// IMPORTING ADAPTIVE CHAMELEON THEME
import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_auth/firebase_auth.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    dropdownValue = AdaptiveChameleonTheme.of(context).themeId;
    themeModeDropdownValue = AdaptiveChameleonTheme.of(context).themeMode!;

    if(themeModeDropdownValue.index == 2) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                "Home",
                style: GoogleFonts.fredoka(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            )
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "👋 Hello, " + FirebaseAuth.instance.currentUser!.displayName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.fredoka(fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Basic Widgets",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.fredoka(fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Text',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'RichText',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'TextFormField',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'TextField',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'DropdownButton',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Slider',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Checkbox',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Radio',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Switch',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'ListTile',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'GridView',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'ListView',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'TabBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'BottomNavigationBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'AppBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Card',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'AlertDialog',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'BottomSheet',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Drawer',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'SnackBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Tooltip',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'InkWell',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Image',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Placeholder',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      // Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                    ],
                  ),
                )
            ),
          )
      );
    } else {
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   centerTitle: false,
        //   elevation: 0,
        //   title: Padding(
        //     padding: EdgeInsets.only(left: 4),
        //     child: Text(
        //       "Home",
        //       style: GoogleFonts.fredoka(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
        //     ),
        //   )
        // ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "👋 Hello, " + FirebaseAuth.instance.currentUser!.displayName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.fredoka(fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Basic Widgets",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.fredoka(fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Text',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'RichText',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'TextFormField',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'TextField',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'DropdownButton',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Slider',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Checkbox',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Radio',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Switch',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'ListTile',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'GridView',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'ListView',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'TabBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'BottomNavigationBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'AppBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Card',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'AlertDialog',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'BottomSheet',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Drawer',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'SnackBar',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Tooltip',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'InkWell',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Image',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: () {

                            },
                            child: Chip(
                              backgroundColor: AdaptiveChameleonTheme.of(context).theme.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              label: Text(
                                'Placeholder',
                                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      // Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                    ],
                  ),
                )
            ),
          )
      );
    }
  }
}
