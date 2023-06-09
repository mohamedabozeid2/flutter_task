
import 'package:hive_flutter/adapters.dart';

import 'hive_keys.dart';

class HiveHelper {
  static late Box<bool> isQuranDownloaded;


  static Future<void> init({required String path}) async {
    await Hive.initFlutter(path);
    //// Register Adapter


    //// Open Boxes
    // surahs = await Hive.openBox<QuranData>(HiveKeys.surahs);

  }


  static Future<void> putInBox({
    required Box box,
    required String key,
    required dynamic data,
  }) async {
    return await box.put(key, data);
  }

  static dynamic getBoxData({
    required Box box,
    required String key,
  }) {
    return box.get(key, defaultValue: '');
  }

  static void removeData({
    required Box box,
    required String key,
  }) {
    box.put(key, '');
  }


}
