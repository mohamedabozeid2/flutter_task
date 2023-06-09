import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/api/main_dio_helper.dart';
import 'core/hive/hive_helper.dart';
import 'core/services/services_locator.dart';
import 'core/utils/constants.dart';
import 'features/presentation/controller/BlocObserver/BlocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Constants.setDirectory(directory);
  HiveHelper.init(path: Constants.getDirectory()!.path);
  ServicesLocator().init();
  MainDioHelper.init();

  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: /*!kReleaseMode*/ false,
      builder: (context) => const MarketSquare(),
    ),
  );
}
