import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'address.dart';
import 'name.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final Name name;
  @HiveField(5)
  final Address address;
  @HiveField(6)
  final String phone;

  User({
    required this.address,
    required this.email,
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.userName,
  });

  @override
  List<Object?> get props => [
        address,
        email,
        id,
        name,
        password,
        phone,
        userName,
      ];
}
