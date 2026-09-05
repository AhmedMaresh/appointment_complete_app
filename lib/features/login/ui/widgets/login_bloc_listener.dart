import 'package:appointment_complete_flutter_app/core/helpers/extensions.dart';
import 'package:appointment_complete_flutter_app/core/networking/api_error_model.dart';
import 'package:appointment_complete_flutter_app/core/routing/routes.dart';
import 'package:appointment_complete_flutter_app/core/theme/colors.dart';
import 'package:appointment_complete_flutter_app/core/theme/styles.dart';
import 'package:appointment_complete_flutter_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appointment_complete_flutter_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              ),
            );
          },
          loginSuccess: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          loginError: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.error, color: Colors.red, size: 32),
          content: Text(
            apiErrorModel.getAllErrorMessages(),
            style: TextStyles.font15DarkBlueMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Got it', style: TextStyles.font14BlueSemiBold),
            ),
          ],
        );
      },
    );
  }
}
