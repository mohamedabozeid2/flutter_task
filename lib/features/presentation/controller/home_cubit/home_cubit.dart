import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/check_connection.dart';
import '../../../../core/utils/constants.dart';
import '../../../data/model/product_model.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/use_cases/home_use_cases/get_all_categories.dart';
import '../../../domain/use_cases/home_use_cases/get_all_products.dart';
import '../../../domain/use_cases/home_use_cases/get_single_category_products.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetSingleCategoryUseCase getSingleCategoryUseCase;
  final GetAllProductsUseCase getAllProductsUseCase;

  HomeCubit(
    this.getAllCategoriesUseCase,
    this.getSingleCategoryUseCase,
    this.getAllProductsUseCase,
  ) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int botNavCurrentIndex = 0;

  void changBotNavBar({required int index}) {
    botNavCurrentIndex = index;
    emit(ChangeBotNavBarState());
  }

  Future<void> getAllData() async {
    emit(HomeGetAllProductsLoadingStates());
    await CheckConnection.checkConnection().then((value) async {
      Constants.setInternetConnection(value);
      if (value) {
        await Future.wait([
          getAllProducts().then((value){
            getAllCategories();
          }),
        ]);
      } else {
        emit(HomeGetAllProductsErrorStates('InternetConnection'));
      }
    });
  }

  List categories = [];

  Future<void> getAllCategories() async {
    getAllCategoriesUseCase.execute().then((value) {
      value.fold((l) {
        emit(HomeGetAllCategoriesErrorStates(l.message));
      }, (r) async {
        await fillCategories(data: r).then((value) {
          emit(HomeGetAllProductsSuccessStates());
        });
      });
    });
  }

  Future<void> fillCategories({required List<dynamic> data}) async {
    categories.addAll(data);
  }

  List<Product> singleCategoryProducts = [];

  Future<void> getSingleCategoryProducts({
    required String category,
  }) async {
    emit(HomeGetSingleCategoryProductsLoadingStates());
    await CheckConnection.checkConnection().then((value) async {
      Constants.setInternetConnection(value);
      if (value) {
        await getSingleCategoryUseCase
            .execute(category: category)
            .then((value) {
          value.fold((l) {
            emit(HomeGetSingleCategoryProductsErrorStates(l.message));
          }, (r) {
            for (var element in r) {
              singleCategoryProducts.add(ProductModel.fromJson(element));
            }
            emit(HomeGetSingleCategoryProductsSuccessStates());
          });
        });
      }
    });
  }

  List<Product> allProducts = [];

  Future<void> getAllProducts() async{
    await getAllProductsUseCase.execute().then((value) {
      value.fold((l) {
        emit(HomeGetAllProductsErrorStates(l.message));
      }, (r) {
        for (var element in r) {
          allProducts.add(ProductModel.fromJson(element));
        }
      });
    });
  }
}
