import '../../../core/api/end_points.dart';
import '../../../core/api/main_dio_helper.dart';
import '../../../core/error/exception.dart';
import '../../../core/network/main_error_message_model.dart';
import '../model/user_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<String> userLogin({
    required String userName,
    required String password,
  });
  Future<UserModel> userRegister({
    required UserModel userData,
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
  Future<UserModel> userRegister({required UserModel userData}) async {
    try {
      final response =
      await MainDioHelper.postData(url: EndPoints.users.endpoint, data: {
        'email': userData.email,
        'username': userData.userName,
        'password': userData.password,
        'name': {
          'firstname': userData.name.firstname,
          'lastname': userData.name.lastname,
        },
        'address': {
          'city': userData.address.city,
          'street': userData.address.street,
          'number': userData.address.number,
          'zipcode': userData.address.zipcode,
          'geolocation': {
            'lat': userData.address.geolocation.lat,
            'long': userData.address.geolocation.long,
          }
        },
        'phone': userData.phone,
      });
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
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
