import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/model/user_model.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, String>> userLogin({
    required String userName,
    required String password,
  });
  Future<Either<Failure, int>> userRegister({
    required String email,
    required String userName,
    required String password,
    required String firstName,
    required String lastName,
    required String city,
    required String street,
    required String streetNumber,
    required String zipCode,
    required String lat,
    required String long,
    required String phone,
  });
}