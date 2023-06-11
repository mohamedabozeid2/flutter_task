import 'dart:io';

import 'package:flutter_task/core/utils/app_values.dart';
import 'package:flutter_task/features/domain/entities/product.dart';

import '../../features/domain/entities/user.dart';

class Constants {
  static Directory? _directory;
  static bool _internetConnection = false;
  static User? _currentUser;
  static String _currentUserToken = "";
  static double mainPadding = AppSize.s15;
  static final List<Product> _favoriteProducts = [];

  static void setFavoriteProducts({
    required List<Product> favoriteProducts
}){
    _favoriteProducts.addAll(favoriteProducts);
  }
  static List<Product> getFavoriteProducts()=> _favoriteProducts;

  static String getCurrentUserToken() => _currentUserToken;

  static void setCurrentUserToken({required String token}) =>
      _currentUserToken = token;

  static User? getCurrentUser() => _currentUser;

  static void setCurrentUser({
    required User currentUser,
  }) =>
      _currentUser = currentUser;

  static Directory? getDirectory() => _directory;

  static void setDirectory(Directory newDirectory) => _directory = newDirectory;

  static bool getInternetConnection() => _internetConnection;

  static void setInternetConnection(bool internetConnection) =>
      _internetConnection = internetConnection;
}
