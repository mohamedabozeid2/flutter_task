import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'name.g.dart';

@HiveType(typeId: 1)
class Name extends HiveObject with EquatableMixin {
  @HiveField(0)final String firstname;
  @HiveField(1)final String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  @override
  List<Object?> get props => [
    firstname,
    lastname,
  ];
}