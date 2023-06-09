import '../../domain/entities/user.dart';
import 'address_model.dart';
import 'name_model.dart';

class UserModel extends User {
  UserModel({
    required super.address,
    required super.email,
    required super.id,
    required super.name,
    required super.password,
    required super.phone,
    required super.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      address: AddressModel.fromJson(json['address']),
      email: json['email'],
      id: json['id'],
      name: NameModel.fromJson(json['name']),
      password: json['password'],
      phone: json['phone'],
      userName: json['username'],
    );
  }
}





