class TowerModel {
  String? range;
  double? latitude;
  double? longitude;

  TowerModel({this.range, this.latitude, this.longitude});

  TowerModel.fromJson(Map<String, dynamic> json) {
    range = json['range'];
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
