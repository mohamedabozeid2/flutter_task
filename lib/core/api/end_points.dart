enum EndPoints {
  users,
  login,
  categories,
  category,
  products,
}

extension EndPointsExtension on EndPoints {
  String get endpoint {
    if (this == EndPoints.users) {
      return '/users';
    } else if (this == EndPoints.login) {
      return '/auth/login';
    } else if (this == EndPoints.categories) {
      return '/products/categories';
    } else if(this == EndPoints.category){
      return '/products/category';
    } else if(this == EndPoints.products){
      return '/products';
    }else {
      throw ArgumentError('Invalid endpoint');
    }
  }
}
