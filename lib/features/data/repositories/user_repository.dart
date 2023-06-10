import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_user_repository.dart';
import '../data_source/user_data_source.dart';

class UserRepository implements BaseUserRepository {
  final BaseUserRemoteDataSource baseUserRemoteDataSource;

  UserRepository(this.baseUserRemoteDataSource);

  @override
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
  }) async {
    try {
      final result = await baseUserRemoteDataSource.userRegister(
        userName: userName,
        email: email,
        password: password,
        city: city,
        firstName: firstName,
        lastName: lastName,
        lat: lat,
        long: long,
        phone: phone,
        street: street,
        streetNumber: streetNumber,
        zipCode: zipCode,
      );
      return Right(result);
    } on MainServerException catch (failure) {
      return Left(
        ServerFailure(failure.mainErrorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, String>> userLogin({
    required String userName,
    required String password,
  }) async {
    try {
      final result = await baseUserRemoteDataSource.userLogin(
        userName: userName,
        password: password,
      );
      return Right(result);
    } on MainServerException catch (failure) {
      return Left(
        ServerFailure(failure.mainErrorMessageModel.statusMessage),
      );
    }
  }
}
