import 'package:hive_flutter/adapters.dart';

import '../../features/domain/entities/user.dart';
import 'hive_keys.dart';

class HiveHelper {
  static late Box<User> currentUser;
  static late Box<String> currentUserToken;
  static late Box<bool> loggedIn;

  static Future<void> init({required String path}) async {
    await Hive.initFlutter(path);
    //// Register Adapter

    //// Open Boxes
    currentUser = await Hive.openBox<User>(HiveKeys.currentUser.toString());
    currentUserToken =
        await Hive.openBox<String>(HiveKeys.currentUserToken.toString());
    loggedIn = await Hive.openBox<bool>(HiveKeys.loggedIn.toString());
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
  }) async {
    return await box.get(key,defaultValue: false);
  }

  static void removeData({
    required Box box,
    required String key,
  }) {
    box.put(key, '');
  }
}
