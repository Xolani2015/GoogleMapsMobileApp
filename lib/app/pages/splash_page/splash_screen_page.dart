// ignore_for_file: use_build_context_synchronously
import 'package:Quickloc8app_attack_mobile_app/app/pages/map_page/map_page.dart';
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
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: mediaQuery * 0.15,
                        // decoration: BoxDecoration(
                        //     color: Configuration().colors.primaryColor,
                        //     borderRadius: const BorderRadius.only(
                        //       bottomRight: Radius.circular(160),
                        //     )
                        //     ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: mediaQuery * 0.15,
                        color: Configuration().colors.primaryWhite,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          _logoWidget(mediaQuery),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: mediaQuery * 0.2,
                        color: Configuration().colors.primaryWhite,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: mediaQuery * 0.2,
                        decoration: BoxDecoration(
                            color: Configuration().colors.primaryWhite,
                            // borderRadius: const BorderRadius.only(
                            //   topLeft: Radius.circular(120),
                            // )
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row _logoWidget(double mediaQuery) {
    return Row(
      children: [
        Expanded(child: Container()),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: mediaQuery * 0.65,
         
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaQuery * 0.05,
                ),
        
                Center(child: Image.asset(ImageAsset.appLogo)),
              ],
            ),
          ),
        ),
          Expanded(child: Container()),
      ],
    );
  }
}
