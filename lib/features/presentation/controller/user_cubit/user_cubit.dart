import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/data/model/user_model.dart';

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
    required int addressNumber,
    required String zipCode,
    required phone,
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

  void userRegister({
    required UserModel userModel,
  }) {
    emit(UserRegisterLoadingState());
    userRegisterUserCase.execute(userData: userModel).then((value) {
      value.fold((l) {
        emit(UserRegisterErrorState(AppStrings.invalidInputs));
      }, (r) {
        print(r.userName);
        addUserDataToCacheMemory(userData: r);
        emit(UserRegisterSuccessState());
      });
    });
  }
}
