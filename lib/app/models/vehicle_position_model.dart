class VehiclePositionModel {
  String? heading;
  double? latitude;
  double? longitude;

  VehiclePositionModel({this.heading, this.latitude, this.longitude});

  VehiclePositionModel.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    if (json['latitude'].runtimeType == String ||
        json['latitude'].runtimeType == int) {
      latitude = double.parse(json['latitude']);
    } else {
      latitude = json['latitude'];
    }

    if (json['longitude'].runtimeType == String ||
        json['longitude'].runtimeType == int) {
      longitude = double.parse(json['longitude']);
    } else {
      longitude = json['longitude'];
    }
  }
}
