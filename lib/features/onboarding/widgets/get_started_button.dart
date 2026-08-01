import 'package:appointment_complete_flutter_app/core/helpers/extensions.dart';
import 'package:appointment_complete_flutter_app/core/routing/routes.dart';
import 'package:appointment_complete_flutter_app/core/theme/colors.dart';
import 'package:appointment_complete_flutter_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(double.infinity, 52),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Text('Get Started', style: TextStyles.font16WhiteSemiBold),
    );
  }
}
