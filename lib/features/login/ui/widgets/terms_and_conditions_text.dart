import 'package:appointment_complete_flutter_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By logging in, you agree to our ",
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: "Terms and Conditions",
            style: TextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: " and ",
            style: TextStyles.font13GreyRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
