import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<dynamic>>> getAllCategories();

  Future<Either<Failure, List<dynamic>>> getSingleCategoryProducts(
      {required String category});

  Future<Either<Failure, List<dynamic>>> getAllProducts();
}
