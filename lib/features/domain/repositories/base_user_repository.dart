import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/model/user_model.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, String>> userLogin({
    required String userName,
    required String password,
  });
  Future<Either<Failure, UserModel>> userRegister({
    required UserModel userData,
  });
}