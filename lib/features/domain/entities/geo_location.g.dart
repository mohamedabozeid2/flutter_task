// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoLocationAdapter extends TypeAdapter<GeoLocation> {
  @override
  final int typeId = 3;

  @override
  GeoLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoLocation(
      lat: fields[0] as String,
      long: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeoLocation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
