import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'geo_location.dart';

part 'address.g.dart';

@HiveType(typeId: 2)
class Address extends HiveObject with EquatableMixin {
  @HiveField(0)final String city;
  @HiveField(1)final String street;
  @HiveField(2)final String number;
  @HiveField(3)final String zipcode;
  @HiveField(4)final GeoLocation geolocation;

  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    city,
    street,
    number,
    zipcode,
    geolocation,
  ];
}