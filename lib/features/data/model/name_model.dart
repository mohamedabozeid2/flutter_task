import '../../domain/entities/name.dart';

class NameModel extends Name {
  NameModel({
    required super.firstname,
    required super.lastname,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(firstname: json['firstname'], lastname: json['lastname']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
    };
  }
}