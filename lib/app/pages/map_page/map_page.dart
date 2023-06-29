// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_button.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_container.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_input_field.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_template.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_text.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/configurations.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/constants/app_image_assets.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return AppTemplate(
        pageBody: Column(
      children: [ 
        SizedBox(
          height: mediaQueryHeight * 0.07,
        ),
      ],
    ));
  }

}
