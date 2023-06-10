import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/adaptive_indicator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/layout_with_background_image.dart';
import '../../controller/user_cubit/user_cubit.dart';
import '../../controller/user_cubit/user_states.dart';
import '../layout/layout.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Color formItemsColor = Colors.white;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController streetController = TextEditingController();

  final TextEditingController streetNumberController = TextEditingController();

  final TextEditingController zipcodeController = TextEditingController();

  @override
  void initState() {
    UserCubit.get(context).isVisible = true;
    UserCubit.get(context).visibilityIcon = AppIcons.visibility;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> fieldsControllers = [
      emailController,
      userNameController,
      firstNameController,
      lastNameController,
      cityController,
      streetController,
      streetNumberController,
      zipcodeController,
      phoneController,
    ];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
              child: Icon(AppIcons.arrowBack, color: Colors.white),
            ),
          ),
        ),
        body: LayoutWithBackgroundImage(
          frontWidget: Container(
            width: Helper.getMaxWidth(),
            padding: EdgeInsets.all(AppSize.s20),
            margin: EdgeInsets.only(
                right: AppSize.s15,
                left: AppSize.s15,
                top: Helper.getMaxHeight() * 0.12,
                bottom: Helper.getMaxHeight() * 0.05),
            decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(AppSize.s20)),
            child: Center(
              child: registerForm(
                  context: context, fieldsControllers: fieldsControllers),
            ),
          ),
        ));
  }

  Widget registerForm({
    required BuildContext context,
    required List<TextEditingController> fieldsControllers,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.signUp,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: formItemsColor),
          ),
          ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: AppSize.s40),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomTextField(
                  context: context,
                  controller: fieldsControllers[index],
                  label: fieldsLabel[index],
                  type: fieldsInputType[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: AppSize.s15,
                );
              },
              itemCount: fieldsControllers.length),
          SizedBox(
            height: AppSize.s15,
          ),
          BlocConsumer<UserCubit, UserStates>(
            buildWhen: (previous, current) =>
                current is UserChangePasswordVisibilityState,
            listener: (context, state) {},
            builder: (context, state) {
              return CustomTextField(
                context: context,
                controller: passwordController,
                type: TextInputType.visiblePassword,
                label: AppStrings.password,
                isPassword: UserCubit.get(context).isVisible,
                sufIconFun: () {
                  UserCubit.get(context).changeVisibility();
                },
                suffixIcon: UserCubit.get(context).visibilityIcon,
              );
            },
          ),
          SizedBox(
            height: AppSize.s15,
          ),
          BlocConsumer<UserCubit, UserStates>(
            buildWhen: (previous, current) =>
                current is UserRegisterLoadingState ||
                current is UserRegisterSuccessState ||
                current is UserRegisterErrorState,
            listener: (context, state) {
              if (state is UserRegisterErrorState) {
                Components.showSnackBar(
                  message: state.error,
                  backgroundColor: Colors.transparent.withOpacity(0.5),
                  textColor: Colors.white,
                );
              } else if(state is UserRegisterSuccessState){
                Components.navigateAndFinish(context: context, widget:  Layout());
              }
            },
            builder: (context, state) {
              return state is UserRegisterLoadingState
                  ? Center(
                      child: AdaptiveIndicator(
                        os: Components.getOS(),
                        color: AppColors.mainColor,
                      ),
                    )
                  : CustomButton(
                      fun: () {
                        UserCubit.get(context).userRegister(
                          zipCode: zipcodeController.text,
                          streetNumber: streetNumberController.text,
                          street: streetController.text,
                          phone: phoneController.text,
                          long: '81.1496',
                          lat: '-37.3159',
                          lastName: lastNameController.text,
                          firstName: firstNameController.text,
                          city: cityController.text,
                          password: passwordController.text,
                          email: emailController.text,
                          userName: userNameController.text,
                        );
                      },
                      text: AppStrings.login,
                      height: AppSize.s50,
                      fontSize: AppFontSize.s18,
                      backgroundColor: AppColors.mainColor,
                      textColor: Colors.white,
                    );
            },
          ),
        ],
      );
  final List<String> fieldsLabel = [
    AppStrings.email,
    AppStrings.userName,
    AppStrings.firstName,
    AppStrings.lastName,
    AppStrings.city,
    AppStrings.street,
    AppStrings.streetNumber,
    AppStrings.zipcode,
    AppStrings.phone,
  ];
  final List<TextInputType> fieldsInputType = [
    TextInputType.emailAddress,
    TextInputType.name,
    TextInputType.name,
    TextInputType.name,
    TextInputType.streetAddress,
    TextInputType.streetAddress,
    TextInputType.number,
    TextInputType.text,
    TextInputType.phone,
  ];
}
