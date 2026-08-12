import 'package:appointment_complete_flutter_app/core/helpers/extensions.dart';
import 'package:appointment_complete_flutter_app/core/routing/routes.dart';
import 'package:appointment_complete_flutter_app/core/theme/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: "Sign In",
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signupScreen);
              },
          ),
        ],
      ),
    );
  }
}
