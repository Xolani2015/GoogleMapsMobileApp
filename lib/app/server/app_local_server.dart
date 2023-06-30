import 'dart:convert';
import 'package:Quickloc8app_attack_mobile_app/app/models/vehicle_position_model.dart';
import 'package:flutter/services.dart';

class AppLocalServer {
  List<VehiclePositionModel> vehiclePositionsList = [];

  set setVehiclePositionList(List<VehiclePositionModel> list) {
    vehiclePositionsList = list;
  }

  List<VehiclePositionModel> get getVehiclePositionList {
    return vehiclePositionsList;
  }
}
