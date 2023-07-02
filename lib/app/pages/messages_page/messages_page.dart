// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:Quickloc8app_attack_mobile_app/app/models/message_model.dart';
import 'package:Quickloc8app_attack_mobile_app/app/pages/map_page/map_page.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<MessageModel> _messagelist = [];
  @override
  void initState() {
    super.initState();
  }

  Future<List<MessageModel>> readMessageJSON() async {
    final String response =
        await rootBundle.loadString('assets/app_data/messages.json');
    List<dynamic> decodedJson = await json.decode(response) as List<dynamic>;
    List<MessageModel> messageList = decodedJson
        .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return messageList;
  }

  Future<List<Widget>> returnMessageItems() async {
    _messagelist = await readMessageJSON();
    List<Widget> messageList = [];

    for (var message in _messagelist) {
      messageList.add(Row(
        children: [
          Expanded(
              child: Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  color: Color.fromARGB(255, 39, 39, 39),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                              child: const Center(
                                  child: Text(
                                'E',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )))),
                      Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    message.subject.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      message.message.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: message.display.toString(),
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.star,
                            size: 32,
                            color: Colors.amber,
                          )
                        ],
                      )),
                    ],
                  )))
        ],
      ));
    }

    return messageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MapPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: Color.fromARGB(255, 2, 2, 14),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: returnMessageItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: ListView(
                          children: snapshot.data!,
                        ),
                      );
                      // return GoogleMap(
                      //   zoomControlsEnabled: false,
                      //   zoomGesturesEnabled: false,
                      //   mapType: MapType.normal,
                      //   initialCameraPosition: _cptPosition,
                      //   onMapCreated: (GoogleMapController controller) {
                      //     _loadDarkMapTheme();
                      //     _controller.complete(controller);
                      //   },
                      //   markers: snapshot.data!.toSet(),
                      // );
                    }
                  },
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
