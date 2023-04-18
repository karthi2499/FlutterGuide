import 'package:flutter/material.dart';

// IMPORTING CIRCULAR PROFILE AVATAR
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING ICONSAX ICONS
import 'package:iconsax/iconsax.dart';

// IMPORTING SERVICES
import 'package:flutterguide/service/authService.dart';

// IMPORTING VIEW/SCREENS
import 'package:flutterguide/view/screens/exportScreens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final String _title = "Flutter Guide";

  String? user = FirebaseAuth.instance.currentUser!.email ??
      FirebaseAuth.instance.currentUser!.displayName;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the incoming message here
    });
  }

  final drawerItems = [
    DrawerItem("Home", Icons.home_rounded),
    DrawerItem("Settings", Icons.settings_rounded),
  ];

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return DashboardScreen();
      case 1:
        return SettingsScreen();
      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        ListTile(
          leading: Icon(d.icon),
          title: Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        ),
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Iconsax.category_25),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          _title,
          style: GoogleFonts.fredoka(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(FirebaseAuth.instance.currentUser!.displayName!),
              accountEmail: Text(FirebaseAuth.instance.currentUser!.email!),
                currentAccountPicture: CircularProfileAvatar(
                FirebaseAuth.instance.currentUser!.photoURL!.toString(),
                backgroundColor: Colors.transparent,
                cacheImage: true,
                foregroundColor: Colors.brown.withOpacity(0.5),
                initialsText: Text(
                  FirebaseAuth.instance.currentUser!.displayName!.substring(0, 1),
                  style: GoogleFonts.fredoka(fontSize: 38),
                ),
                radius: 100,
                showInitialTextAbovePicture: true,
              ),
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
