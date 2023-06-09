import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_user_repository.dart';
import '../data_source/user_data_source.dart';
import '../model/user_model.dart';

class UserRepository implements BaseUserRepository {
  final BaseUserRemoteDataSource baseUserRemoteDataSource;

  UserRepository(this.baseUserRemoteDataSource);

  @override
  Future<Either<Failure, UserModel>> userRegister(
      {required UserModel userData}) async {
    try {
      final result =
          await baseUserRemoteDataSource.userRegister(userData: userData);
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
