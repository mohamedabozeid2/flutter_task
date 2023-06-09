import 'package:hive_flutter/adapters.dart';

import '../../features/domain/entities/user.dart';
import 'hive_keys.dart';

class HiveHelper {
  static late Box<User> currentUser;
  static late Box<String> currentUserToken;

  static Future<void> init({required String path}) async {
    await Hive.initFlutter(path);
    //// Register Adapter

    //// Open Boxes
    currentUser = await Hive.openBox<User>(HiveKeys.currentUser.toString());
    currentUserToken =
        await Hive.openBox<String>(HiveKeys.currentUserToken.toString());
  }

  static Future<void> putInBox({
    required Box box,
    required String key,
    required dynamic data,
  }) async {
    return await box.put(key, data);
  }

  static Future<dynamic> getBoxData({
    required Box box,
    required String key,
  }) async{
    return await box.get(key);
  }

  static void removeData({
    required Box box,
    required String key,
  }) {
    box.put(key, '');
  }
}
