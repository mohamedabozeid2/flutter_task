import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_home_repository.dart';

class GetAllProductsUseCase{
  final BaseHomeRepository baseHomeRepository;

  GetAllProductsUseCase(this.baseHomeRepository);

  Future<Either<Failure, List<dynamic>>> execute()async{
    return await baseHomeRepository.getAllProducts();
  }
}