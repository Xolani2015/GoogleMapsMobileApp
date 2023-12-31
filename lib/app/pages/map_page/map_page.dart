// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:Quickloc8app_attack_mobile_app/app/models/tower_model.dart';
import 'package:Quickloc8app_attack_mobile_app/app/models/vehicle_position_model.dart';
import 'package:Quickloc8app_attack_mobile_app/app/pages/messages_page/messages_page.dart';
import 'package:Quickloc8app_attack_mobile_app/app/server/app_local_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  AppLocalServer localServer = AppLocalServer();
  late Position userPosition;
  List<VehiclePositionModel> vehiclePositionList2 = [];
  List<TowerModel> towerPositonList2 = [];
  int mapFocusNum = 0;

  Future<Set<Marker>> returnMapMarkers() async {
    _loadDarkMapTheme();
    vehiclePositionList2 = await readVehiclePositionJSON();
    towerPositonList2 = await readTowerJSON();
    Set<Marker> markers = {};
    final vehicleIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(8, 8)),
        'assets/images/general/ic_new_white_taxi_re.png');
    for (var vehiclePosition in vehiclePositionList2) {
      markers.add(Marker(
          markerId: MarkerId('car'),
          infoWindow: InfoWindow(
            title: 'car icon',
          ),
          icon: vehicleIcon,
          position: LatLng(
              vehiclePosition.latitude ?? 0, vehiclePosition.longitude ?? 0),
          rotation: double.parse(vehiclePosition.heading.toString())));
    }

    final towerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(8, 8)),
        'assets/images/general/smalltower.png');
    for (var tower in towerPositonList2) {
      markers.add(Marker(
        markerId: MarkerId('tower'),
        infoWindow: InfoWindow(
          title: 'towers icon',
        ),
        icon: towerIcon,
        position: LatLng(tower.latitude ?? 0, tower.longitude ?? 0),
      ));
    }

    return markers;
  }

  Future<List<VehiclePositionModel>> readVehiclePositionJSON() async {
    final String response =
        await rootBundle.loadString('assets/app_data/vehicleCordinates.json');
    List<dynamic> decodedJson = await json.decode(response) as List<dynamic>;
    List<VehiclePositionModel> vehiclePositionList = decodedJson
        .map((e) => VehiclePositionModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return vehiclePositionList;
  }

  Future<List<TowerModel>> readTowerJSON() async {
    final String response =
        await rootBundle.loadString('assets/app_data/towers.json');
    List<dynamic> decodedJson = await json.decode(response) as List<dynamic>;
    List<TowerModel> towerList = decodedJson
        .map((e) => TowerModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return towerList;
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
//-33.983889, 18.482338
  static const CameraPosition _cptPosition = CameraPosition(
    target: LatLng(-8.368168, 24.829703),
    zoom: 3.887,
  );
  @override
  Widget build(BuildContext context) {
    _loadDarkMapTheme();
    return Scaffold(
      body: FutureBuilder(
        future: returnMapMarkers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _cptPosition,
              onMapCreated: (GoogleMapController controller) async {
                _loadDarkMapTheme();
                var darkMapStyle = await rootBundle
                    .loadString('assets/images/logo/red_theme.json');
                controller.setMapStyle(darkMapStyle);
                _controller.complete(controller);
              },
              markers: snapshot.data!.toSet(),
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagePage(),
                ),
              );
            },
            label: const Text(
              'Messages',
              style: TextStyle(color: Colors.black),
            ),
            icon: const Icon(Icons.message, color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () async {
                  CameraPosition _queenstown = CameraPosition(
                      bearing: 192.8334901395799,
                      target: LatLng(-33.948581, 18.618294),
                      zoom: 9.387);
                  final GoogleMapController controller =
                      await _controller.future;
                  await controller.animateCamera(
                      CameraUpdate.newCameraPosition(_queenstown));
                },
                label: const Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () async {
                  CameraPosition _queenstown = CameraPosition(
                      bearing: 192.8334901395799,
                      target: LatLng(-31.896264, 26.871527),
                      zoom: 14.151926040649414);
                  final GoogleMapController controller =
                      await _controller.future;
                  await controller.animateCamera(
                      CameraUpdate.newCameraPosition(_queenstown));
                },
                label: const Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.arrow_forward_ios_outlined,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _loadDarkMapTheme() async {
    final GoogleMapController controller = await _controller.future;
    var darkMapStyle =
        await rootBundle.loadString('assets/images/logo/red_theme.json');
    controller.setMapStyle(darkMapStyle);
  }
}
