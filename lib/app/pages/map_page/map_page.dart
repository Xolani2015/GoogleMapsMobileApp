// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:Quickloc8app_attack_mobile_app/app/models/vehicle_position_model.dart';
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
    vehiclePositionList2 = await readVehiclePositionJSON();
    Set<Marker> markers = {};

    for (var vehiclePosition in vehiclePositionList2) {
      markers.add(Marker(
          markerId: MarkerId('car'),
          infoWindow: InfoWindow(
            title: 'car icon',
          ),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(
              vehiclePosition.latitude ?? 0, vehiclePosition.longitude ?? 0)));
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

  @override
  void initState() {
    super.initState();
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
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: snapshot.data!.toSet(),
            );
          }
        },
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
