import 'package:flutter/material.dart';

// IMPORTING DEVICE & APP INFO DEPENDENCIES
import 'package:cross_platform/cross_platform.dart';
import 'package:package_info_plus/package_info_plus.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
    buildSignature: '',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTileAppName(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.abc_rounded),
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  Widget _infoTilePackageName(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.feed),
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  Widget _infoTileVersion(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.numbers),
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  Widget _infoTileBuild(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.build),
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  Widget _buildContent() {
    if (Platform.isAndroid) {
      return const ListTile(
        leading: Icon(Icons.android),
        title: Text("Platform"),
        subtitle: Text("Android"),
      );
    } else if (Platform.isIOS) {
      return const ListTile(
        leading: Icon(Icons.apple),
        title: Text("Platform"),
        subtitle: Text("iOS"),
      );
    } else if (Platform.isWeb) {
      return const ListTile(
        leading: Icon(Icons.web),
        title: Text("Platform"),
        subtitle: Text("Web"),
      );
    } else {
      return const ListTile(
        title: Text("Flutter Guide is Currently Not Available in this Platform"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "About",
          style: GoogleFonts.fredoka(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Center(
                  child: Image.asset("assets/logo_without_bg.png", width: 300,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _infoTileAppName('App Name', _packageInfo.appName),
                      _infoTilePackageName('Package Name', _packageInfo.packageName),
                      _infoTileVersion('App Version', _packageInfo.version),
                      _infoTileBuild('Build', _packageInfo.buildNumber),
                      _buildContent(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
