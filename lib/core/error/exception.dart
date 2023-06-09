
import '../network/main_error_message_model.dart';

class MainServerException implements Exception {
  final MainErrorMessageModel mainErrorMessageModel;

  MainServerException({
    required this.mainErrorMessageModel,
  });
}