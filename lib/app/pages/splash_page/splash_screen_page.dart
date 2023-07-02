// ignore_for_file: use_build_context_synchronously
import 'package:Quickloc8app_attack_mobile_app/app/pages/map_page/map_page.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/configurations.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/constants/app_image_assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  _navigateToHomePage() async {
    await Future.delayed(
      const Duration(milliseconds: 3500),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MapPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            _logoWidget(mediaQuery),
          ],
        ),
      ),
    );
  }

  Widget _logoWidget(double mediaQuery) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              child: AvatarGlow(
                glowColor: Colors.white,
                endRadius: 100.0,
                duration: Duration(milliseconds: 1000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Material(
                  // Replace this child with your own
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 221, 221, 221),
                    child: Image.asset(
                      ImageAsset.appLogo,
                      height: 100,
                    ),
                    radius: 55.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        AppText(
          text: 'Loading...',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        )
      ],
    );
  }
}
