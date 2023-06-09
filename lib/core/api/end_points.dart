enum EndPoints {
  users,
  login,
}

extension EndPointsExtension on EndPoints {
  String get endpoint {
    if (this == EndPoints.users) {
      return '/users';
    } else if (this == EndPoints.login) {
      return '/auth/login';
    } else {
      throw ArgumentError('Invalid endpoint');
    }
  }
}
