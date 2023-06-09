abstract class UserStates{}

class UserInitialState extends UserStates{}

class UserChangePasswordVisibilityState extends UserStates{}

class UserLoginLoadingState extends UserStates{}
class UserLoginSuccessState extends UserStates{}
class UserLoginErrorState extends UserStates{
  final String error;

  UserLoginErrorState(this.error);
}
class UserRegisterLoadingState extends UserStates{}
class UserRegisterSuccessState extends UserStates{}
class UserRegisterErrorState extends UserStates{
  final String error;

  UserRegisterErrorState(this.error);
}