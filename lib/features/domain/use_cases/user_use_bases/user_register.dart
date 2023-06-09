import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../data/model/user_model.dart';
import '../../repositories/base_user_repository.dart';

class UserRegisterUseCase {
  final BaseUserRepository baseRegisterRepository;

  UserRegisterUseCase(this.baseRegisterRepository);

  Future<Either<Failure, UserModel>> execute({
    required UserModel userData,
  }) async {
    return await baseRegisterRepository.userRegister(userData: userData);
  }
}
