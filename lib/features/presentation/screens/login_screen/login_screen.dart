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
import 'widgets/no_email_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final Color formItemsColor = Colors.white;

  @override
  void initState() {
    UserCubit.get(context).isVisible = true;
    UserCubit.get(context).visibilityIcon = AppIcons.visibility;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: LayoutWithBackgroundImage(
          frontWidget: Container(
        width: Helper.getMaxWidth(),
        padding: EdgeInsets.all(AppSize.s20),
        margin: EdgeInsets.all(AppSize.s15),
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppSize.s20)),
        child: Center(
          child: loginForm(
            context: context,
          ),
        ),
      )),
    );
  }

  Widget loginForm({
    required BuildContext context,
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: AppSize.s15,
          ),
          CustomTextField(
            context: context,
            controller: userNameController,
            type: TextInputType.name,
            borderColor: formItemsColor,
            label: AppStrings.userName,
          ),
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
                isPassword: UserCubit.get(context).isVisible,
                suffixIcon: UserCubit.get(context).visibilityIcon,
                sufIconFun: () => UserCubit.get(context).changeVisibility(),
                borderColor: formItemsColor,
                label: AppStrings.password,
              );
            },
          ),
          SizedBox(
            height: AppSize.s15,
          ),
          BlocConsumer<UserCubit, UserStates>(
            buildWhen: (previous, current) =>
                current is UserLoginLoadingState ||
                current is UserLoginSuccessState ||
                current is UserLoginErrorState,
            listener: (context, state) {
              if (state is UserLoginErrorState) {
                Components.showSnackBar(
                  message: state.error,
                  backgroundColor: Colors.transparent.withOpacity(0.5),
                  textColor: Colors.white,
                );
              } else if (state is UserLoginSuccessState) {
                Components.navigateAndFinish(
                    context: context, widget: Layout());
              }
            },
            builder: (context, state) {
              return state is UserLoginLoadingState
                  ? Center(
                      child: AdaptiveIndicator(
                      os: Components.getOS(),
                      color: formItemsColor,
                    ))
                  : CustomButton(
                      fun: () {
                        UserCubit.get(context).userLogin(
                          userName: userNameController.text,
                          password: passwordController.text,
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
          SizedBox(
            height: AppSize.s15,
          ),
          const NoEmailWidget(),
        ],
      );
}
