import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_home_repository.dart';
import '../data_source/home_data_source.dart';

class HomeRepository implements BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, List<dynamic>>> getAllCategories() async {
    try {
      final result = await baseHomeRemoteDataSource.getAllCategories();
      return Right(result);
    } on MainServerException catch (failure) {
      return Left(
        ServerFailure(failure.mainErrorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> getSingleCategoryProducts(
      {required String category}) async {
    try {
      final result = await baseHomeRemoteDataSource.getSingleCategoryProducts(
        category: category,
      );
      return Right(result);
    } on MainServerException catch (failure) {
      return Left(
        ServerFailure(failure.mainErrorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List>> getAllProducts() async {
    try {
      final result = await baseHomeRemoteDataSource.getAllProducts();
      return Right(result);
    } on MainServerException catch (failure) {
      return Left(
        ServerFailure(failure.mainErrorMessageModel.statusMessage),
      );
    }
  }
}
