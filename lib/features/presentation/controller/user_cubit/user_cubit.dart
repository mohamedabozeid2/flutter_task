import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/hive/hive_helper.dart';
import '../../../../core/hive/hive_keys.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/user_use_bases/user_login.dart';
import '../../../domain/use_cases/user_use_bases/user_register.dart';
import 'user_states.dart';

class UserCubit extends Cubit<UserStates> {
  final UserLoginUseCase userLoginUseCase;
  final UserRegisterUseCase userRegisterUserCase;

  UserCubit(
    this.userLoginUseCase,
    this.userRegisterUserCase,
  ) : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  IconData visibilityIcon = AppIcons.visibility;

  void changeVisibility() {
    isVisible = !isVisible;
    if (isVisible) {
      visibilityIcon = AppIcons.visibility;
    } else {
      visibilityIcon = AppIcons.visibilityOff;
    }
    emit(UserChangePasswordVisibilityState());
  }

  bool loginValidation({
    required String userName,
    required String password,
  }) {
    if (userName.isEmpty) {
      emit(UserLoginErrorState(AppStrings.userNameValidation));
      return false;
    } else if (password.isEmpty) {
      emit(UserLoginErrorState(AppStrings.passwordValidation));
      return false;
    } else {
      return true;
    }
  }

  Future<void> userLogin({
    required String userName,
    required String password,
  }) async {
    emit(UserLoginLoadingState());
    if (loginValidation(userName: userName, password: password)) {
      userLoginUseCase
          .execute(userName: userName, password: password)
          .then((value) {
        value.fold((l) {
          emit(UserLoginErrorState(AppStrings.wrongUserNameOrPassword));
        }, (r) {
          addCurrentUserTokenToCacheMemory(token: r);

          emit(UserLoginSuccessState());
        });
      });
    }
  }

  void addCurrentUserTokenToCacheMemory({
    required String token,
  }) {
    HiveHelper.putInBox(
      box: HiveHelper.currentUserToken,
      key: HiveKeys.currentUserToken.toString(),
      data: token,
    );
    Constants.setCurrentUserToken(token: token);
    HiveHelper.putInBox(box: HiveHelper.loggedIn, key: HiveKeys.loggedIn.toString(), data: true);

  }

  void addUserDataToCacheMemory({required User userData}) {
    HiveHelper.putInBox(
      box: HiveHelper.currentUser,
      key: HiveKeys.currentUser.toString(),
      data: userData,
    );
    Constants.setCurrentUser(currentUser: userData);
  }

  bool registerValidation({
    required String userName,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
    required String city,
    required String street,
    required String streetNumber,
    required String zipCode,
    required phone,
  }) {
    if (email.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.emailValidation));
      return false;
    } else if (userName.isEmpty) {
      emit(UserLoginErrorState(AppStrings.userNameValidation));
      return false;
    } else if (firstName.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.firstNameValidation));
      return false;
    } else if (lastName.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.lastNameValidation));
      return false;
    } else if (city.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.cityValidation));
      return false;
    } else if (street.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.streetValidation));
      return false;
    } else if (streetNumber.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.streetNumberValidation));
      return false;
    } else if (zipCode.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.zipCodeValidation));
      return false;
    } else if (phone.isEmpty) {
      emit(UserRegisterErrorState(AppStrings.phoneValidation));
      return false;
    } else if (password.isEmpty) {
      emit(UserLoginErrorState(AppStrings.passwordValidation));
      return false;
    } else {
      return true;
    }
  }

  void userRegister({
    required String email,
    required String userName,
    required String password,
    required String firstName,
    required String lastName,
    required String city,
    required String street,
    required String streetNumber,
    required String zipCode,
    required String lat,
    required String long,
    required String phone,
  }) {
    emit(UserRegisterLoadingState());
    if (registerValidation(
        userName: userName,
        password: password,
        email: email,
        firstName: firstName,
        lastName: lastName,
        city: city,
        street: street,
        streetNumber: streetNumber,
        zipCode: zipCode,
        phone: phone)) {
      userRegisterUserCase
          .execute(
        userName: userName,
        email: email,
        password: password,
        city: city,
        firstName: firstName,
        lastName: lastName,
        lat: lat,
        long: long,
        phone: phone,
        street: street,
        streetNumber: streetNumber,
        zipCode: zipCode,
      )
          .then((value) {
        value.fold((l) {
          emit(UserRegisterErrorState(AppStrings.invalidInputs));
        }, (r) {
          HiveHelper.putInBox(
            box: HiveHelper.loggedIn,
            key: HiveKeys.loggedIn.toString(),
            data: true,
          );
          emit(UserRegisterSuccessState());
        });
      });
    }
  }
}
