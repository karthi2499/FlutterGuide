import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// IMPORTING ADAPTIVE CHAMELEON THEME
import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING ICONSAX ICONS
import 'package:iconsax/iconsax.dart';

// IMPORTING URL LAUNCHER
import 'package:url_launcher/url_launcher.dart';

// IMPORTING SERVICES
import 'package:flutterguide/service/authService.dart';

// IMPORTING UTILS/THEME
import 'package:flutterguide/utils/AppTheme/appTheme.dart';

// IMPORTING VIEW/SCREENS
import 'package:flutterguide/view/screens/exportScreens.dart';

final Uri _privacyPolicyURL = Uri.parse('https://doc-hosting.flycricket.io/flutter-guide-privacy-policy/0848fc1c-99b5-4556-8978-f14db89cba40/privacy');
final Uri _termsAndConditionsURL = Uri.parse('https://doc-hosting.flycricket.io/flutter-guide-terms-conditions/889fe666-a5f6-49e7-80cc-2441ee9128bd/terms');

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int dropdownValue = 0;
  ThemeMode themeModeDropdownValue = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    dropdownValue = AdaptiveChameleonTheme.of(context).themeId;
    themeModeDropdownValue = AdaptiveChameleonTheme.of(context).themeMode!;

    if(themeModeDropdownValue.index == 2) {
      return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "General",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutScreen()),
                          );
                        },
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              child: Icon(
                                  Icons.new_releases_rounded,
                                  color: Colors.white,
                                  size: 20
                              ),
                            ),
                            title: Text("About", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                            trailing: IconButton(
                              icon: Icon(Icons.chevron_right_rounded),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AboutScreen()),
                                );
                              },
                            )
                        ),
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Appearance",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: Icon(
                              Icons.brush,
                              color: Colors.white,
                              size: 20
                          ),
                        ),
                        title: Text("Color Theme", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                        trailing: DropdownButton(
                          // icon: const Icon(Icons.arrow_downward),
                          value: dropdownValue,
                          items: [
                            DropdownMenuItem(
                              value: AppThemes.red,
                              child: Text(AppThemes.toStr(AppThemes.red)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.blue,
                              child: Text(AppThemes.toStr(AppThemes.blue)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.purple,
                              child: Text(AppThemes.toStr(AppThemes.purple)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.amber,
                              child: Text(AppThemes.toStr(AppThemes.amber)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.green,
                              child: Text(AppThemes.toStr(AppThemes.green)),
                            ),
                          ],
                          onChanged: (dynamic themeId) async {
                            await AdaptiveChameleonTheme.of(context).setTheme(themeId);
                            setState(() {
                              dropdownValue = themeId;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 32,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: Icon(
                              Icons.dark_mode_rounded,
                              color: Colors.white,
                              size: 20
                          ),
                        ),
                        title: Text(
                          "Current Mode",
                          style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Dark",
                          style: GoogleFonts.fredoka(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        trailing: ThemeModeSelectorWidget(),
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Account",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: () {
                          AuthService().signOut();
                        },
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              child: Icon(
                                  Icons.logout_rounded,
                                  color: Colors.white,
                                  size: 20
                              ),
                            ),
                            title: Text("Logout", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                            trailing: IconButton(
                              icon: Icon(Icons.chevron_right_rounded),
                              onPressed: () {
                                AuthService().signOut();
                              },
                            )
                        ),
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Privacy & Terms",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: _launchPrivacyPolicyURL,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            child: Icon(
                                Icons.shield_rounded,
                                color: Colors.white,
                                size: 20
                            ),
                          ),
                          title: Text("Privacy Policy", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                        ),
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: _launchTermsAndConditionsURL,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            child: Icon(
                                Icons.file_copy_rounded,
                                color: Colors.white,
                                size: 20
                            ),
                          ),
                          title: Text("Terms of Service", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          )
      );
    } else {
      return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "General",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutScreen()),
                          );
                        },
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              child: Icon(
                                  Icons.new_releases_rounded,
                                  color: Colors.white,
                                  size: 20
                              ),
                            ),
                            title: Text("About", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                            trailing: IconButton(
                              icon: Icon(Icons.chevron_right_rounded),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AboutScreen()),
                                );
                              },
                            )
                        ),
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Appearance",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: Icon(
                              Icons.brush_rounded,
                              color: Colors.white,
                              size: 20
                          ),
                        ),
                        title: Text("Color Theme", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                        trailing: DropdownButton(
                          // icon: const Icon(Icons.arrow_downward),
                          value: dropdownValue,
                          items: [
                            DropdownMenuItem(
                              value: AppThemes.red,
                              child: Text(AppThemes.toStr(AppThemes.red)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.blue,
                              child: Text(AppThemes.toStr(AppThemes.blue)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.purple,
                              child: Text(AppThemes.toStr(AppThemes.purple)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.amber,
                              child: Text(AppThemes.toStr(AppThemes.amber)),
                            ),
                            DropdownMenuItem(
                              value: AppThemes.green,
                              child: Text(AppThemes.toStr(AppThemes.green)),
                            ),
                          ],
                          onChanged: (dynamic themeId) async {
                            await AdaptiveChameleonTheme.of(context).setTheme(themeId);
                            setState(() {
                              dropdownValue = themeId;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 32,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: Icon(
                              Icons.light_mode_rounded,
                              color: Colors.white,
                              size: 20
                          ),
                        ),
                        title: Text(
                          "Current Mode",
                          style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Light",
                          style: GoogleFonts.fredoka(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        trailing: ThemeModeSelectorWidget(),
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Account",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: () {
                          AuthService().signOut();
                        },
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              child: Icon(
                                  Icons.logout_rounded,
                                  color: Colors.white,
                                  size: 20
                              ),
                            ),
                            title: Text("Logout", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                            trailing: IconButton(
                              icon: Icon(Icons.chevron_right_rounded),
                              onPressed: () {
                                AuthService().signOut();
                              },
                            )
                        ),
                      ),
                      SizedBox(height: 32,),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          Text(
                            "Privacy & Terms",
                            style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: _launchPrivacyPolicyURL,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            child: Icon(
                                Icons.shield_rounded,
                                color: Colors.white,
                                size: 20
                            ),
                          ),
                          title: Text("Privacy Policy", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                        ),
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        onTap: _launchTermsAndConditionsURL,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            child: Icon(
                                Icons.file_copy_rounded,
                                color: Colors.white,
                                size: 20
                            ),
                          ),
                          title: Text("Terms of Service", style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),),
                        ),
                      ),
                      SizedBox(height: 32,),
                    ],
                  )
              ),
            )
          )
      );
    }
  }
}

void _launchPrivacyPolicyURL() async {
  if (!await launchUrl(_privacyPolicyURL)) throw 'Could not launch $_privacyPolicyURL';
}

void _launchTermsAndConditionsURL() async {
  if (!await launchUrl(_termsAndConditionsURL)) throw 'Could not launch $_termsAndConditionsURL';
}