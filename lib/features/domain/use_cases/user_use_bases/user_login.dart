import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_user_repository.dart';

class UserLoginUseCase {
  final BaseUserRepository baseLoginRepository;

  UserLoginUseCase(this.baseLoginRepository);

  Future<Either<Failure, String>> execute({
    required String userName,
    required String password,
  }) async {
    return await baseLoginRepository.userLogin(
      password: password,
      userName: userName,
    );
  }
}
