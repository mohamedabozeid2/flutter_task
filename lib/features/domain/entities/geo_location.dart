import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'geo_location.g.dart';

@HiveType(typeId: 3)
class GeoLocation extends HiveObject with EquatableMixin {
  @HiveField(0)final String lat;
  @HiveField(1)final String long;

  GeoLocation({
    required this.lat,
    required this.long,
  });

  @override
  List<Object?> get props => [
    lat,
    long,
  ];
}
