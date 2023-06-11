import 'package:hive_flutter/adapters.dart';

import '../../features/domain/entities/address.dart';
import '../../features/domain/entities/geo_location.dart';
import '../../features/domain/entities/name.dart';
import '../../features/domain/entities/product.dart';
import '../../features/domain/entities/user.dart';
import 'hive_keys.dart';

class HiveHelper {
  static late Box<User> currentUser;
  static late Box<String> currentUserToken;
  static late Box<bool> loggedIn;
  static late Box<List<Product>> favoriteProducts;

  static Future<void> init({required String path}) async {
    await Hive.initFlutter(path);
    //// Register Adapter

    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(NameAdapter());
    Hive.registerAdapter(GeoLocationAdapter());
    Hive.registerAdapter(AddressAdapter());

    //// Open Boxes
    currentUser = await Hive.openBox<User>(HiveKeys.currentUser.toString());
    currentUserToken =
        await Hive.openBox<String>(HiveKeys.currentUserToken.toString());
    loggedIn = await Hive.openBox<bool>(HiveKeys.loggedIn.toString());
    favoriteProducts =
        await Hive.openBox<List<Product>>(HiveKeys.favoriteProducts.toString());
  }

  static Future<void> putInBox({
    required Box box,
    required String key,
    required dynamic data,
  }) async {
    return await box.put(key, data);
  }

  // static Future<void> putInFavoriteProducts({
  //   required List<Product> favoriteList,
  // }) async {
  //   return await favoriteProducts.put(
  //       HiveKeys.favoriteProducts.toString(), favoriteList);
  // }

  static Future<dynamic> getBoxData({
    required Box box,
    required String key,
  }) async {

    return await box.get(key, defaultValue: false);
  }

  // static Future<List<Product>> getFavoriteBox() async {
  //   print("TEST");
  //   print(favoriteProducts.get(HiveKeys.favoriteProducts.toString()).runtimeType);
  //   final List<Product> defaultList = [];
  //   final List<Product>? favoriteList =
  //       await favoriteProducts.get(HiveKeys.favoriteProducts.toString());
  //   return favoriteList ?? defaultList;
  // }

  static void removeData({
    required Box box,
    required String key,
  }) {
    box.put(key, '');
  }
}
