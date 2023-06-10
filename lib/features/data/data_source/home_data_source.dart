import '../../../core/api/end_points.dart';
import '../../../core/api/main_dio_helper.dart';
import '../../../core/error/exception.dart';
import '../../../core/network/main_error_message_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<dynamic>> getAllCategories();

  Future<List<dynamic>> getSingleCategoryProducts({required String category});

  Future<List<dynamic>> getAllProducts();
}

class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  @override
  Future<List<dynamic>> getAllCategories() async {
    try {
      final response =
          await MainDioHelper.getData(url: EndPoints.categories.endpoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw MainServerException(
            mainErrorMessageModel:
                MainErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw MainServerException(
        mainErrorMessageModel: MainErrorMessageModel(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<List<dynamic>> getSingleCategoryProducts({
    required String category,
  }) async {
    try {
      final response = await MainDioHelper.getData(
          url: "${EndPoints.category.endpoint}/$category");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw MainServerException(
            mainErrorMessageModel:
                MainErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw MainServerException(
        mainErrorMessageModel: MainErrorMessageModel(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<List> getAllProducts() async {
    try {
      final response =
          await MainDioHelper.getData(url: EndPoints.products.endpoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw MainServerException(
            mainErrorMessageModel:
                MainErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw MainServerException(
        mainErrorMessageModel: MainErrorMessageModel(
          statusMessage: e.toString(),
        ),
      );
    }
  }
}
