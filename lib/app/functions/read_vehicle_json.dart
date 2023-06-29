import 'dart:convert';
import 'package:Quickloc8app_attack_mobile_app/app/models/vehicle_position_model.dart';
import 'package:flutter/services.dart';

Future<void> readVehiclePositionJson() async {
  final String response =
      await rootBundle.loadString('assets/app_data/vehicleCordinates.json');
  final decodedJson = await json.decode(response);
  var vehiclePosition = VehiclePositionModel.fromJson(decodedJson);
  print('kind');
// ...
}
