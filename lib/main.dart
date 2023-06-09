import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'features/presentation/controller/BlocObserver/BlocObserver.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: /*!kReleaseMode*/ false,
      builder: (context) => const MarketSquare(),
    ),
  );
}
