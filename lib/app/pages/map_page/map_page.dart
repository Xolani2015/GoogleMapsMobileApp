// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
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

  Future<Set<Marker>> vehicleMarkers() async {
    _loadDarkMapTheme();
    vehiclePositionList2 = await readVehiclePositionJSON();
    Set<Marker> markers = {};
    final icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(8, 8)),
        'assets/images/general/ic_new_white_taxi_re.png');
    for (var vehiclePosition in vehiclePositionList2) {
      markers.add(Marker(
          markerId: MarkerId('car'),
          infoWindow: InfoWindow(
            title: 'car icon',
          ),
          icon: icon,
          position: LatLng(
              vehiclePosition.latitude ?? 0, vehiclePosition.longitude ?? 0),
          rotation: double.parse(vehiclePosition.heading.toString())));
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

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
//-33.983889, 18.482338
  static const CameraPosition _cptPosition = CameraPosition(
    target: LatLng(-33.948581, 18.618294),
    zoom: 9.387,
  );
  @override
  Widget build(BuildContext context) {
    _loadDarkMapTheme();
    return Scaffold(
      body: FutureBuilder(
        future: vehicleMarkers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return GoogleMap(
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _cptPosition,
              onMapCreated: (GoogleMapController controller) {
                _loadDarkMapTheme();
                _controller.complete(controller);
              },
              markers: snapshot.data!.toSet(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 221, 60, 48),
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
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.directions_boat, color: Colors.white),
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
