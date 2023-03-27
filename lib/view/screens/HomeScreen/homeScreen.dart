import 'package:flutter/material.dart';

// IMPORTING FIREBASE DEPENDENCIES
import 'package:firebase_auth/firebase_auth.dart';

// IMPORTING FLUTTER NAVIGATION DRAWER
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

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
  String? user = FirebaseAuth.instance.currentUser!.email ??
      FirebaseAuth.instance.currentUser!.displayName;

  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  late String title;

  @override
  void initState() {
    title = "Flutter Guide";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
          appBar: SliderAppBar(
              appBarColor: Colors.white,
              appBarHeight: 90,
              title: Text(
                  title,
                  style: GoogleFonts.fredoka(
                      fontSize: 22, fontWeight: FontWeight.w500)
              )
          ),
          key: _sliderDrawerKey,
          sliderOpenSize: 220,
          slider: _SliderView(
            onItemClick: (title) {
              _sliderDrawerKey.currentState!.closeSlider();
              setState(() {
                this.title = title;
              });
            },
          ),
          child: DashboardScreen()
      ),
    );
  }
}

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 60,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: Image.network(
                      FirebaseAuth.instance.currentUser!.photoURL.toString())
                  .image,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.displayName!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.email!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.fredoka(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          ...[
            Menu(Icons.dashboard, 'Dashboard'),
            Menu(Icons.video_library_rounded, 'Tutorials'),
            Menu(Icons.settings, 'Settings'),
          ].map((menu) => _SliderMenuItem(
                  title: menu.title,
                  iconData: menu.iconData,
                  onTap: onItemClick
            )
          ).toList(),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
            title,
            style: GoogleFonts.fredoka()
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 4),
          child: Icon(iconData),
        ),
        onTap: () => onTap?.call(title));
  }
}

class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}
