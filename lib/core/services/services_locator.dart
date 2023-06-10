import 'package:get_it/get_it.dart';

import '../../features/data/data_source/home_data_source.dart';
import '../../features/data/data_source/user_data_source.dart';
import '../../features/data/repositories/home_repository.dart';
import '../../features/data/repositories/user_repository.dart';
import '../../features/domain/repositories/base_home_repository.dart';
import '../../features/domain/repositories/base_user_repository.dart';
import '../../features/domain/use_cases/home_use_cases/get_all_categories.dart';
import '../../features/domain/use_cases/home_use_cases/get_all_products.dart';
import '../../features/domain/use_cases/home_use_cases/get_single_category_products.dart';
import '../../features/domain/use_cases/user_use_bases/user_login.dart';
import '../../features/domain/use_cases/user_use_bases/user_register.dart';
import '../../features/presentation/controller/home_cubit/home_cubit.dart';
import '../../features/presentation/controller/user_cubit/user_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //// Cubit
    sl.registerLazySingleton(() => HomeCubit(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerLazySingleton(() => UserCubit(
          sl(),
          sl(),
        ));

    /////Use Cases
    sl.registerLazySingleton(() => UserRegisterUseCase(sl()));
    sl.registerLazySingleton(() => UserLoginUseCase(sl()));
    sl.registerLazySingleton(() => GetAllCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetSingleCategoryUseCase(sl()));
    sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));

    ////Repositories
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    ////Data Source
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());

    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource());
  }
}
