// ignore_for_file: use_build_context_synchronously
import 'package:Quickloc8app_attack_mobile_app/app/pages/map_page/map_page.dart';
import 'package:flutter/material.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/configurations.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/constants/app_image_assets.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
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
        ],
      ),
    );
  }
}
