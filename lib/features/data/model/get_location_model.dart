import '../../domain/entities/geo_location.dart';

class GeoLocationModel extends GeoLocation {
  GeoLocationModel({
    required super.lat,
    required super.long,
  });

  factory GeoLocationModel.fromJson(Map<String, dynamic> json) {
    return GeoLocationModel(
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
    };
  }
}
