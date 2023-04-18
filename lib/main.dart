import 'package:flutter/material.dart';

// IMPORTING ADAPTIVE CHAMELEON THEME
import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:permission_handler/permission_handler.dart';

// IMPORTING SERVICES
import 'package:flutterguide/service/authService.dart';

// IMPORTING UTILS/THEME
import 'package:flutterguide/utils/AppTheme/appTheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(FlutterGuide());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class FlutterGuide extends StatefulWidget {
  @override
  _FlutterGuideAppState createState() => _FlutterGuideAppState();
}

class _FlutterGuideAppState extends State<FlutterGuide> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    // Request permission to receive notifications
    _requestNotificationPermission();
    // Initialize Firebase Cloud Messaging
    FirebaseMessaging.instance.getToken().then((token) {
      print("FirebaseMessaging token: $token");
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  Future<void> _requestNotificationPermission() async {
    final PermissionStatus permissionStatus = await Permission.notification.request();
    if (permissionStatus == PermissionStatus.granted) {
      FirebaseMessaging.instance.getToken().then((token) {
        print("FirebaseMessaging token: $token");
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Permission error'),
          content: Text('Please grant permission to receive notifications.'),
          actions: <Widget>[
            OutlinedButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveChameleonThemeWidget(
        themeCollection: AppThemes.themeCollection,
        darkThemeCollection: AppThemes.darkThemeCollection,
        defaultThemeId: AppThemes.blue,
        builder: (context, theme, darkTheme, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthService().handleAuthState(),
            darkTheme: darkTheme,
            theme: theme,
            themeMode: themeMode,
            title: 'Flutter Guide',
          );
        }
    );
  }
}