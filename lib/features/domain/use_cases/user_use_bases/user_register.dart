import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_user_repository.dart';

class UserRegisterUseCase {
  final BaseUserRepository baseRegisterRepository;

  UserRegisterUseCase(this.baseRegisterRepository);

  Future<Either<Failure, int>> execute({
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
    return await baseRegisterRepository.userRegister(
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
  }
}
