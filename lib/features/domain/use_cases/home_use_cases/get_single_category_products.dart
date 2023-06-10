import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_home_repository.dart';

class GetSingleCategoryUseCase {
  final BaseHomeRepository baseHomeRepository;

  GetSingleCategoryUseCase(this.baseHomeRepository);

  Future<Either<Failure, List<dynamic>>> execute(
      {required String category}) async {
    return await baseHomeRepository.getSingleCategoryProducts(
        category: category);
  }
}
