import '../../../core/api/end_points.dart';
import '../../../core/api/main_dio_helper.dart';
import '../../../core/error/exception.dart';
import '../../../core/network/main_error_message_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<String> userLogin({
    required String userName,
    required String password,
  });

  Future<int> userRegister({
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
  });
}

class UserRemoteDataSource implements BaseUserRemoteDataSource {
  @override
  Future<String> userLogin({
    required String userName,
    required String password,
  }) async {
    try {
      final response =
          await MainDioHelper.postData(url: EndPoints.login.endpoint, data: {
        'username': userName,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
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
  Future<int> userRegister({
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
    try {
      final response =
          await MainDioHelper.postData(url: EndPoints.users.endpoint, data: {
        'email': email,
        'username': userName,
        'password': password,
        'name': {
          'firstname': firstName,
          'lastname': lastName,
        },
        'address': {
          'city': city,
          'street': street,
          'number': streetNumber,
          'zipcode': zipCode,
          'geolocation': {
            'lat': lat,
            'long': long,
          }
        },
        'phone': phone,
      });
      if (response.statusCode == 200) {
        return response.data['id'];
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
