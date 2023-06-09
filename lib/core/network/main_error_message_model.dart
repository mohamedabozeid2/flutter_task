import 'package:equatable/equatable.dart';

class MainErrorMessageModel extends Equatable {
  final String statusMessage;

  const MainErrorMessageModel({
    required this.statusMessage,
  });

  factory MainErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return MainErrorMessageModel(
      statusMessage: json['status'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        statusMessage,
      ];
}
