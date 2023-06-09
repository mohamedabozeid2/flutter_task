import 'package:equatable/equatable.dart';

class MainErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;

  const MainErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
  });

  factory MainErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return MainErrorMessageModel(
      statusCode: json['code'],
      statusMessage: json['status'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        statusCode,
        statusMessage,
      ];
}
