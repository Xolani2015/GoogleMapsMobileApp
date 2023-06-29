// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:Quickloc8app_attack_mobile_app/app/functions/read_vehicle_json.dart';
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
  late Position userPosition;

//   Future<void> readVehiclePositionJson() async {
//     final String response =
//         await rootBundle.loadString('assets/vehicleCordinates.json');
//     final data = await json.decode(response);
// // ...
//   }

  List<Marker> vehicleMarkers() {
    List<Marker> markers = [
      Marker(
          markerId: MarkerId('car'),
          infoWindow: InfoWindow(
            title: 'car icon',
          ),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(37.42796133580664, -122.085749655962))
    ];
    // readVehiclePositionJson();
    readVehiclePositionJson();
    return markers;
  }

  @override
  void initState() {
    super.initState();
    // determinePosition();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static final Marker _carMarker = Marker(
      markerId: MarkerId('car'),
      infoWindow: InfoWindow(
        title: 'car icon',
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(37.42796133580664, -122.085749655962));
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {_carMarker, vehicleMarkers().first},
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
